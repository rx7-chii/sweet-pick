-- SWEET PICK product schema (Phase 2)

CREATE EXTENSION IF NOT EXISTS "pg_trgm";

CREATE TABLE IF NOT EXISTS channels (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  code VARCHAR(20) NOT NULL UNIQUE,
  name VARCHAR(50) NOT NULL,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE TABLE IF NOT EXISTS categories (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  name VARCHAR(50) NOT NULL,
  slug VARCHAR(50) NOT NULL UNIQUE,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE TABLE IF NOT EXISTS products (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  code VARCHAR(20) UNIQUE,
  channel_id UUID NOT NULL REFERENCES channels(id),
  category_id UUID REFERENCES categories(id),
  name VARCHAR(200) NOT NULL,
  description TEXT,
  image_url TEXT,
  purchase_hint VARCHAR(200),
  is_new BOOLEAN NOT NULL DEFAULT false,
  is_limited_period BOOLEAN NOT NULL DEFAULT false,
  is_store_limited BOOLEAN NOT NULL DEFAULT false,
  is_active BOOLEAN NOT NULL DEFAULT true,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE TABLE IF NOT EXISTS tags (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  name VARCHAR(100) NOT NULL UNIQUE,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE TABLE IF NOT EXISTS product_tags (
  product_id UUID NOT NULL REFERENCES products(id) ON DELETE CASCADE,
  tag_id UUID NOT NULL REFERENCES tags(id) ON DELETE CASCADE,
  PRIMARY KEY (product_id, tag_id)
);

CREATE TABLE IF NOT EXISTS trend_scores (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  product_id UUID NOT NULL REFERENCES products(id) ON DELETE CASCADE,
  channel_id UUID NOT NULL REFERENCES channels(id),
  score INTEGER NOT NULL CHECK (score >= 0 AND score <= 100),
  score_date DATE NOT NULL DEFAULT CURRENT_DATE,
  UNIQUE (product_id, channel_id, score_date)
);

CREATE TABLE IF NOT EXISTS sponsor_slots (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  product_id UUID NOT NULL REFERENCES products(id),
  channel_id UUID NOT NULL REFERENCES channels(id),
  start_date DATE NOT NULL DEFAULT CURRENT_DATE,
  end_date DATE NOT NULL DEFAULT (CURRENT_DATE + INTERVAL '365 days'),
  is_active BOOLEAN NOT NULL DEFAULT true,
  display_order INTEGER NOT NULL DEFAULT 0
);

CREATE INDEX IF NOT EXISTS idx_products_channel ON products(channel_id);
CREATE INDEX IF NOT EXISTS idx_products_active ON products(is_active);
CREATE INDEX IF NOT EXISTS idx_products_name_trgm ON products USING gin (name gin_trgm_ops);
CREATE INDEX IF NOT EXISTS idx_product_tags_tag ON product_tags(tag_id);
CREATE INDEX IF NOT EXISTS idx_trend_channel_date ON trend_scores(channel_id, score_date DESC, score DESC);

CREATE OR REPLACE FUNCTION set_updated_at()
RETURNS TRIGGER AS $$
BEGIN
  NEW.updated_at = now();
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS products_updated_at ON products;
CREATE TRIGGER products_updated_at
  BEFORE UPDATE ON products
  FOR EACH ROW EXECUTE FUNCTION set_updated_at();

CREATE OR REPLACE VIEW product_catalog AS
SELECT
  p.id,
  p.code,
  p.name,
  p.description,
  p.image_url,
  p.purchase_hint,
  p.is_new,
  p.is_limited_period,
  p.is_store_limited,
  c.code AS channel,
  cat.name AS category,
  COALESCE(ts.score, 0) AS trend_score,
  COALESCE(
    (
      SELECT array_agg(t.name ORDER BY t.name)
      FROM product_tags pt
      JOIN tags t ON t.id = pt.tag_id
      WHERE pt.product_id = p.id
    ),
    ARRAY[]::text[]
  ) AS tags,
  EXISTS (
    SELECT 1
    FROM sponsor_slots ss
    WHERE ss.product_id = p.id
      AND ss.channel_id = c.id
      AND ss.is_active = true
      AND CURRENT_DATE BETWEEN ss.start_date AND ss.end_date
  ) AS is_sponsor
FROM products p
JOIN channels c ON p.channel_id = c.id
LEFT JOIN categories cat ON p.category_id = cat.id
LEFT JOIN trend_scores ts
  ON ts.product_id = p.id
  AND ts.channel_id = c.id
  AND ts.score_date = CURRENT_DATE
WHERE p.is_active = true;

ALTER TABLE channels ENABLE ROW LEVEL SECURITY;
ALTER TABLE categories ENABLE ROW LEVEL SECURITY;
ALTER TABLE products ENABLE ROW LEVEL SECURITY;
ALTER TABLE tags ENABLE ROW LEVEL SECURITY;
ALTER TABLE product_tags ENABLE ROW LEVEL SECURITY;
ALTER TABLE trend_scores ENABLE ROW LEVEL SECURITY;
ALTER TABLE sponsor_slots ENABLE ROW LEVEL SECURITY;

CREATE POLICY "anon_read_channels" ON channels FOR SELECT TO anon USING (true);
CREATE POLICY "anon_read_categories" ON categories FOR SELECT TO anon USING (true);
CREATE POLICY "anon_read_products" ON products FOR SELECT TO anon USING (is_active = true);
CREATE POLICY "anon_read_tags" ON tags FOR SELECT TO anon USING (true);
CREATE POLICY "anon_read_product_tags" ON product_tags FOR SELECT TO anon USING (true);
CREATE POLICY "anon_read_trend_scores" ON trend_scores FOR SELECT TO anon USING (true);
CREATE POLICY "anon_read_sponsor_slots" ON sponsor_slots FOR SELECT TO anon USING (is_active = true);
