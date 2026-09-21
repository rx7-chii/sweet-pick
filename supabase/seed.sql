-- SWEET PICK seed data (auto-generated)
BEGIN;

INSERT INTO channels (code, name) VALUES
  ('convenience', 'コンビニ'),
  ('department', 'デパ地下')
ON CONFLICT (code) DO NOTHING;

INSERT INTO categories (name, slug) VALUES
  ('スナック','snack'),('チョコレート','chocolate'),('和菓子','wagashi'),
  ('クッキー','cookie'),('洋菓子','western'),('キャンディ','candy'),('グミ','gummy'),('アイス','ice')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tags (name) VALUES
  ('ポテチ'),
  ('スナック'),
  ('100円以下'),
  ('期間限定'),
  ('チョコ'),
  ('クッキー'),
  ('スポンサー'),
  ('ギフト'),
  ('和菓子')
ON CONFLICT (name) DO NOTHING;

INSERT INTO products (code, channel_id, category_id, name, description, image_url, purchase_hint, is_new, is_limited_period, is_store_limited)
SELECT 'c1', c.id, cat.id, 'うすしおポテトチップス', '今SNSで話題の定番薄味。', '/images/sweets/chips.jpg', 'コンビニ全店', false, false, false
FROM channels c, categories cat
WHERE c.code = 'convenience' AND cat.slug = 'snack'
ON CONFLICT (code) DO NOTHING;

INSERT INTO products (code, channel_id, category_id, name, description, image_url, purchase_hint, is_new, is_limited_period, is_store_limited)
SELECT 'c2', c.id, cat.id, 'スパイシーポテトスティック', 'ピリ辛がクセになる新定番。', '/images/sweets/chips.jpg', 'セブン-イレブン', false, false, true
FROM channels c, categories cat
WHERE c.code = 'convenience' AND cat.slug = 'snack'
ON CONFLICT (code) DO NOTHING;

INSERT INTO products (code, channel_id, category_id, name, description, image_url, purchase_hint, is_new, is_limited_period, is_store_limited)
SELECT 'c3', c.id, cat.id, 'のりしおポテト', 'ごはんのお供にもなるコクうま味。', '/images/sweets/chips.jpg', 'ファミリーマート', false, false, true
FROM channels c, categories cat
WHERE c.code = 'convenience' AND cat.slug = 'snack'
ON CONFLICT (code) DO NOTHING;

INSERT INTO products (code, channel_id, category_id, name, description, image_url, purchase_hint, is_new, is_limited_period, is_store_limited)
SELECT 'c4', c.id, cat.id, '季節限定 さくらポテチ', '春限定のほのかな桜風味。', '/images/sweets/chips.jpg', 'ローソン', true, true, true
FROM channels c, categories cat
WHERE c.code = 'convenience' AND cat.slug = 'snack'
ON CONFLICT (code) DO NOTHING;

INSERT INTO products (code, channel_id, category_id, name, description, image_url, purchase_hint, is_new, is_limited_period, is_store_limited)
SELECT 'c5', c.id, cat.id, 'ミルクチョコレートバー', 'なめらかな口どけの定番チョコ。', '/images/sweets/chocolate.jpg', 'コンビニ全店', false, false, false
FROM channels c, categories cat
WHERE c.code = 'convenience' AND cat.slug = 'chocolate'
ON CONFLICT (code) DO NOTHING;

INSERT INTO products (code, channel_id, category_id, name, description, image_url, purchase_hint, is_new, is_limited_period, is_store_limited)
SELECT 'c6', c.id, cat.id, '塩バターサブレ', 'バターの風味が広がるサクサク食感。', '/images/sweets/cookie.jpg', 'コンビニ全店', true, false, false
FROM channels c, categories cat
WHERE c.code = 'convenience' AND cat.slug = 'cookie'
ON CONFLICT (code) DO NOTHING;

INSERT INTO products (code, channel_id, category_id, name, description, image_url, purchase_hint, is_new, is_limited_period, is_store_limited)
SELECT 'c7', c.id, cat.id, 'プレミアムポテチ トリュフ風味', 'コンビニ限定の贅沢ポテチ。', '/images/sweets/chips.jpg', 'セブン-イレブン', false, false, true
FROM channels c, categories cat
WHERE c.code = 'convenience' AND cat.slug = 'snack'
ON CONFLICT (code) DO NOTHING;

INSERT INTO products (code, channel_id, category_id, name, description, image_url, purchase_hint, is_new, is_limited_period, is_store_limited)
SELECT 'd1', c.id, cat.id, '銀座の苺タルト', 'デパ地下で行列の人気スイーツ。', '/images/sweets/gift.jpg', '百貨店デパ地下', false, false, false
FROM channels c, categories cat
WHERE c.code = 'department' AND cat.slug = 'western'
ON CONFLICT (code) DO NOTHING;

INSERT INTO products (code, channel_id, category_id, name, description, image_url, purchase_hint, is_new, is_limited_period, is_store_limited)
SELECT 'd2', c.id, cat.id, '季節の和菓子詰合せ', '贈答に最適な上品な詰め合わせ。', '/images/sweets/wagashi.jpg', '高島屋デパ地下', false, false, true
FROM channels c, categories cat
WHERE c.code = 'department' AND cat.slug = 'wagashi'
ON CONFLICT (code) DO NOTHING;

INSERT INTO products (code, channel_id, category_id, name, description, image_url, purchase_hint, is_new, is_limited_period, is_store_limited)
SELECT 'd3', c.id, cat.id, 'ベルギー産チョコレート詰合せ', '高級感あるチョコの定番ギフト。', '/images/sweets/chocolate.jpg', '三越デパ地下', false, false, true
FROM channels c, categories cat
WHERE c.code = 'department' AND cat.slug = 'chocolate'
ON CONFLICT (code) DO NOTHING;

INSERT INTO products (code, channel_id, category_id, name, description, image_url, purchase_hint, is_new, is_limited_period, is_store_limited)
SELECT 'd4', c.id, cat.id, 'マカロンアソート', 'インスタで話題のカラフルマカロン。', '/images/sweets/candy.jpg', '伊勢丹デパ地下', true, true, true
FROM channels c, categories cat
WHERE c.code = 'department' AND cat.slug = 'western'
ON CONFLICT (code) DO NOTHING;

INSERT INTO products (code, channel_id, category_id, name, description, image_url, purchase_hint, is_new, is_limited_period, is_store_limited)
SELECT 'd5', c.id, cat.id, '老舗の最中セット', '伝統と話題性を兼ね備えた贈答品。', '/images/sweets/wagashi.jpg', '日本橋三越', false, false, true
FROM channels c, categories cat
WHERE c.code = 'department' AND cat.slug = 'wagashi'
ON CONFLICT (code) DO NOTHING;

INSERT INTO products (code, channel_id, category_id, name, description, image_url, purchase_hint, is_new, is_limited_period, is_store_limited)
SELECT 'd6', c.id, cat.id, '限定コラボ チョコレート', 'デパ地下限定のコラボ商品。', '/images/sweets/chocolate.jpg', '阪急うめだ本店', false, true, true
FROM channels c, categories cat
WHERE c.code = 'department' AND cat.slug = 'chocolate'
ON CONFLICT (code) DO NOTHING;

INSERT INTO products (code, channel_id, category_id, name, description, image_url, purchase_hint, is_new, is_limited_period, is_store_limited)
SELECT 'c8', c.id, cat.id, 'カルムーcho', '人気の2層チョコ', '/images/sweets/chocolate.jpg', 'ローソン', false, false, false
FROM channels c, categories cat
WHERE c.code = 'convenience' AND cat.slug = 'chocolate'
ON CONFLICT (code) DO NOTHING;

INSERT INTO products (code, channel_id, category_id, name, description, image_url, purchase_hint, is_new, is_limited_period, is_store_limited)
SELECT 'c9', c.id, cat.id, 'じゃがりこ サラダ', 'サクサクスティック', '/images/sweets/chips.jpg', 'コンビニ全店', false, false, false
FROM channels c, categories cat
WHERE c.code = 'convenience' AND cat.slug = 'snack'
ON CONFLICT (code) DO NOTHING;

INSERT INTO products (code, channel_id, category_id, name, description, image_url, purchase_hint, is_new, is_limited_period, is_store_limited)
SELECT 'c10', c.id, cat.id, '黒チョコクッキー', 'コク深い定番', '/images/sweets/cookie.jpg', 'ファミリーマート', false, false, false
FROM channels c, categories cat
WHERE c.code = 'convenience' AND cat.slug = 'cookie'
ON CONFLICT (code) DO NOTHING;

INSERT INTO products (code, channel_id, category_id, name, description, image_url, purchase_hint, is_new, is_limited_period, is_store_limited)
SELECT 'c11', c.id, cat.id, '宇治抹茶チョコ', '抹茶の風味', '/images/sweets/chocolate.jpg', 'セブン-イレブン', false, false, false
FROM channels c, categories cat
WHERE c.code = 'convenience' AND cat.slug = 'chocolate'
ON CONFLICT (code) DO NOTHING;

INSERT INTO products (code, channel_id, category_id, name, description, image_url, purchase_hint, is_new, is_limited_period, is_store_limited)
SELECT 'c12', c.id, cat.id, 'チョコパイ', 'ふわふわ定番', '/images/sweets/cookie.jpg', 'コンビニ全店', false, false, false
FROM channels c, categories cat
WHERE c.code = 'convenience' AND cat.slug = 'western'
ON CONFLICT (code) DO NOTHING;

INSERT INTO products (code, channel_id, category_id, name, description, image_url, purchase_hint, is_new, is_limited_period, is_store_limited)
SELECT 'c13', c.id, cat.id, 'かっぱえびせん', '海老の風味', '/images/sweets/chips.jpg', 'コンビニ全店', false, false, false
FROM channels c, categories cat
WHERE c.code = 'convenience' AND cat.slug = 'snack'
ON CONFLICT (code) DO NOTHING;

INSERT INTO products (code, channel_id, category_id, name, description, image_url, purchase_hint, is_new, is_limited_period, is_store_limited)
SELECT 'c14', c.id, cat.id, 'チーズおかき', 'チーズ風味', '/images/sweets/chips.jpg', 'ローソン', false, false, false
FROM channels c, categories cat
WHERE c.code = 'convenience' AND cat.slug = 'snack'
ON CONFLICT (code) DO NOTHING;

INSERT INTO products (code, channel_id, category_id, name, description, image_url, purchase_hint, is_new, is_limited_period, is_store_limited)
SELECT 'c15', c.id, cat.id, '白い恋人 ミニ', '北海道定番', '/images/sweets/cookie.jpg', '空港・駅ナカ', false, false, false
FROM channels c, categories cat
WHERE c.code = 'convenience' AND cat.slug = 'cookie'
ON CONFLICT (code) DO NOTHING;

INSERT INTO products (code, channel_id, category_id, name, description, image_url, purchase_hint, is_new, is_limited_period, is_store_limited)
SELECT 'c16', c.id, cat.id, '明治ミルクチョコ', '定番板チョコ', '/images/sweets/chocolate.jpg', 'コンビニ全店', false, false, false
FROM channels c, categories cat
WHERE c.code = 'convenience' AND cat.slug = 'chocolate'
ON CONFLICT (code) DO NOTHING;

INSERT INTO products (code, channel_id, category_id, name, description, image_url, purchase_hint, is_new, is_limited_period, is_store_limited)
SELECT 'c17', c.id, cat.id, 'きのこの山', '形がかわいい', '/images/sweets/chocolate.jpg', 'コンビニ全店', false, false, false
FROM channels c, categories cat
WHERE c.code = 'convenience' AND cat.slug = 'chocolate'
ON CONFLICT (code) DO NOTHING;

INSERT INTO products (code, channel_id, category_id, name, description, image_url, purchase_hint, is_new, is_limited_period, is_store_limited)
SELECT 'c18', c.id, cat.id, 'たけのこの里', 'サクサク食感', '/images/sweets/chocolate.jpg', 'コンビニ全店', false, false, false
FROM channels c, categories cat
WHERE c.code = 'convenience' AND cat.slug = 'chocolate'
ON CONFLICT (code) DO NOTHING;

INSERT INTO products (code, channel_id, category_id, name, description, image_url, purchase_hint, is_new, is_limited_period, is_store_limited)
SELECT 'c19', c.id, cat.id, 'ラムネキャンディ', '懐かしい味', '/images/sweets/candy.jpg', 'コンビニ全店', false, false, false
FROM channels c, categories cat
WHERE c.code = 'convenience' AND cat.slug = 'candy'
ON CONFLICT (code) DO NOTHING;

INSERT INTO products (code, channel_id, category_id, name, description, image_url, purchase_hint, is_new, is_limited_period, is_store_limited)
SELECT 'c20', c.id, cat.id, 'グミ 巨峰', '果汁感', '/images/sweets/candy.jpg', 'ファミリーマート', false, false, false
FROM channels c, categories cat
WHERE c.code = 'convenience' AND cat.slug = 'gummy'
ON CONFLICT (code) DO NOTHING;

INSERT INTO products (code, channel_id, category_id, name, description, image_url, purchase_hint, is_new, is_limited_period, is_store_limited)
SELECT 'c21', c.id, cat.id, 'カントリーマアム', '定番クッキー', '/images/sweets/cookie.jpg', 'コンビニ全店', false, false, false
FROM channels c, categories cat
WHERE c.code = 'convenience' AND cat.slug = 'cookie'
ON CONFLICT (code) DO NOTHING;

INSERT INTO products (code, channel_id, category_id, name, description, image_url, purchase_hint, is_new, is_limited_period, is_store_limited)
SELECT 'c22', c.id, cat.id, 'ポッキー チョコ', 'ロングスナック', '/images/sweets/chips.jpg', 'コンビニ全店', false, false, false
FROM channels c, categories cat
WHERE c.code = 'convenience' AND cat.slug = 'snack'
ON CONFLICT (code) DO NOTHING;

INSERT INTO products (code, channel_id, category_id, name, description, image_url, purchase_hint, is_new, is_limited_period, is_store_limited)
SELECT 'c23', c.id, cat.id, 'アルフォート', 'ビスケット入り', '/images/sweets/chocolate.jpg', 'セブン-イレブン', false, false, false
FROM channels c, categories cat
WHERE c.code = 'convenience' AND cat.slug = 'chocolate'
ON CONFLICT (code) DO NOTHING;

INSERT INTO products (code, channel_id, category_id, name, description, image_url, purchase_hint, is_new, is_limited_period, is_store_limited)
SELECT 'c24', c.id, cat.id, 'ブラックサンダー', 'コスパ良し', '/images/sweets/chocolate.jpg', 'コンビニ全店', false, false, false
FROM channels c, categories cat
WHERE c.code = 'convenience' AND cat.slug = 'chocolate'
ON CONFLICT (code) DO NOTHING;

INSERT INTO products (code, channel_id, category_id, name, description, image_url, purchase_hint, is_new, is_limited_period, is_store_limited)
SELECT 'c25', c.id, cat.id, '熟成チョコ', '期間限定', '/images/sweets/chocolate.jpg', 'ローソン', true, true, false
FROM channels c, categories cat
WHERE c.code = 'convenience' AND cat.slug = 'chocolate'
ON CONFLICT (code) DO NOTHING;

INSERT INTO products (code, channel_id, category_id, name, description, image_url, purchase_hint, is_new, is_limited_period, is_store_limited)
SELECT 'c26', c.id, cat.id, '厚切りポテト', 'ボリューム感', '/images/sweets/chips.jpg', 'セブン-イレブン', false, false, false
FROM channels c, categories cat
WHERE c.code = 'convenience' AND cat.slug = 'snack'
ON CONFLICT (code) DO NOTHING;

INSERT INTO products (code, channel_id, category_id, name, description, image_url, purchase_hint, is_new, is_limited_period, is_store_limited)
SELECT 'c27', c.id, cat.id, 'ハッピーターン', 'あまいスナック', '/images/sweets/chips.jpg', 'コンビニ全店', false, false, false
FROM channels c, categories cat
WHERE c.code = 'convenience' AND cat.slug = 'snack'
ON CONFLICT (code) DO NOTHING;

INSERT INTO products (code, channel_id, category_id, name, description, image_url, purchase_hint, is_new, is_limited_period, is_store_limited)
SELECT 'c28', c.id, cat.id, 'コアラのマーチ', 'かわいい形', '/images/sweets/chocolate.jpg', 'コンビニ全店', false, false, false
FROM channels c, categories cat
WHERE c.code = 'convenience' AND cat.slug = 'chocolate'
ON CONFLICT (code) DO NOTHING;

INSERT INTO products (code, channel_id, category_id, name, description, image_url, purchase_hint, is_new, is_limited_period, is_store_limited)
SELECT 'c29', c.id, cat.id, 'チョコボール', 'ピーナッツ入り', '/images/sweets/chocolate.jpg', 'ファミリーマート', false, false, false
FROM channels c, categories cat
WHERE c.code = 'convenience' AND cat.slug = 'chocolate'
ON CONFLICT (code) DO NOTHING;

INSERT INTO products (code, channel_id, category_id, name, description, image_url, purchase_hint, is_new, is_limited_period, is_store_limited)
SELECT 'c30', c.id, cat.id, 'どら焼き', 'コンビニ和菓子', '/images/sweets/wagashi.jpg', 'ローソン', false, false, false
FROM channels c, categories cat
WHERE c.code = 'convenience' AND cat.slug = 'wagashi'
ON CONFLICT (code) DO NOTHING;

INSERT INTO products (code, channel_id, category_id, name, description, image_url, purchase_hint, is_new, is_limited_period, is_store_limited)
SELECT 'c31', c.id, cat.id, 'わらび餅', 'みたらし風味', '/images/sweets/wagashi.jpg', 'セブン-イレブン', false, false, false
FROM channels c, categories cat
WHERE c.code = 'convenience' AND cat.slug = 'wagashi'
ON CONFLICT (code) DO NOTHING;

INSERT INTO products (code, channel_id, category_id, name, description, image_url, purchase_hint, is_new, is_limited_period, is_store_limited)
SELECT 'c32', c.id, cat.id, 'シュークリーム', '冷蔵スイーツ', '/images/sweets/gift.jpg', 'ファミリーマート', true, false, false
FROM channels c, categories cat
WHERE c.code = 'convenience' AND cat.slug = 'western'
ON CONFLICT (code) DO NOTHING;

INSERT INTO products (code, channel_id, category_id, name, description, image_url, purchase_hint, is_new, is_limited_period, is_store_limited)
SELECT 'c33', c.id, cat.id, 'メロンパン チョコ', '新作', '/images/sweets/cookie.jpg', 'ローソン', true, false, false
FROM channels c, categories cat
WHERE c.code = 'convenience' AND cat.slug = 'western'
ON CONFLICT (code) DO NOTHING;

INSERT INTO products (code, channel_id, category_id, name, description, image_url, purchase_hint, is_new, is_limited_period, is_store_limited)
SELECT 'c34', c.id, cat.id, 'ソフトクリーム 風', '期間限定', '/images/sweets/candy.jpg', 'セブン-イレブン', true, true, false
FROM channels c, categories cat
WHERE c.code = 'convenience' AND cat.slug = 'ice'
ON CONFLICT (code) DO NOTHING;

INSERT INTO products (code, channel_id, category_id, name, description, image_url, purchase_hint, is_new, is_limited_period, is_store_limited)
SELECT 'd7', c.id, cat.id, 'フィナンシェ詰合せ', '焼き菓子ギフト', '/images/sweets/gift.jpg', '松屋銀座', false, false, true
FROM channels c, categories cat
WHERE c.code = 'department' AND cat.slug = 'western'
ON CONFLICT (code) DO NOTHING;

INSERT INTO products (code, channel_id, category_id, name, description, image_url, purchase_hint, is_new, is_limited_period, is_store_limited)
SELECT 'd8', c.id, cat.id, 'どら焼き 特選', '老舗の味', '/images/sweets/wagashi.jpg', '日本橋高島屋', false, false, true
FROM channels c, categories cat
WHERE c.code = 'department' AND cat.slug = 'wagashi'
ON CONFLICT (code) DO NOTHING;

INSERT INTO products (code, channel_id, category_id, name, description, image_url, purchase_hint, is_new, is_limited_period, is_store_limited)
SELECT 'd9', c.id, cat.id, 'ガトーショコラ', '濃厚チョコ', '/images/sweets/chocolate.jpg', '伊勢丹', false, false, true
FROM channels c, categories cat
WHERE c.code = 'department' AND cat.slug = 'western'
ON CONFLICT (code) DO NOTHING;

INSERT INTO products (code, channel_id, category_id, name, description, image_url, purchase_hint, is_new, is_limited_period, is_store_limited)
SELECT 'd10', c.id, cat.id, '羊羹 特選', '贈答用', '/images/sweets/wagashi.jpg', '三越', false, false, true
FROM channels c, categories cat
WHERE c.code = 'department' AND cat.slug = 'wagashi'
ON CONFLICT (code) DO NOTHING;

INSERT INTO products (code, channel_id, category_id, name, description, image_url, purchase_hint, is_new, is_limited_period, is_store_limited)
SELECT 'd11', c.id, cat.id, 'クッキー アソート', '洋菓子詰合せ', '/images/sweets/cookie.jpg', '高島屋', false, false, true
FROM channels c, categories cat
WHERE c.code = 'department' AND cat.slug = 'cookie'
ON CONFLICT (code) DO NOTHING;

INSERT INTO products (code, channel_id, category_id, name, description, image_url, purchase_hint, is_new, is_limited_period, is_store_limited)
SELECT 'd12', c.id, cat.id, '抹茶ラングドシャ', '抹茶スイーツ', '/images/sweets/gift.jpg', '京都・大丸', false, false, true
FROM channels c, categories cat
WHERE c.code = 'department' AND cat.slug = 'western'
ON CONFLICT (code) DO NOTHING;

INSERT INTO products (code, channel_id, category_id, name, description, image_url, purchase_hint, is_new, is_limited_period, is_store_limited)
SELECT 'd13', c.id, cat.id, 'バウムクーヘン', '層が美しい', '/images/sweets/gift.jpg', 'JR 駅ナカ', false, false, true
FROM channels c, categories cat
WHERE c.code = 'department' AND cat.slug = 'western'
ON CONFLICT (code) DO NOTHING;

INSERT INTO products (code, channel_id, category_id, name, description, image_url, purchase_hint, is_new, is_limited_period, is_store_limited)
SELECT 'd14', c.id, cat.id, '桜餅 特選', '春限定', '/images/sweets/wagashi.jpg', '春・三越', true, true, true
FROM channels c, categories cat
WHERE c.code = 'department' AND cat.slug = 'wagashi'
ON CONFLICT (code) DO NOTHING;

INSERT INTO products (code, channel_id, category_id, name, description, image_url, purchase_hint, is_new, is_limited_period, is_store_limited)
SELECT 'd15', c.id, cat.id, 'モンブラン 個包装', '栗スイーツ', '/images/sweets/gift.jpg', '阪神', false, false, true
FROM channels c, categories cat
WHERE c.code = 'department' AND cat.slug = 'western'
ON CONFLICT (code) DO NOTHING;

INSERT INTO products (code, channel_id, category_id, name, description, image_url, purchase_hint, is_new, is_limited_period, is_store_limited)
SELECT 'd16', c.id, cat.id, '赤ワイン チョコ', '大人向け', '/images/sweets/chocolate.jpg', '神戸・大丸', false, false, true
FROM channels c, categories cat
WHERE c.code = 'department' AND cat.slug = 'chocolate'
ON CONFLICT (code) DO NOTHING;

INSERT INTO products (code, channel_id, category_id, name, description, image_url, purchase_hint, is_new, is_limited_period, is_store_limited)
SELECT 'd17', c.id, cat.id, '和洋折衷 詰合せ', 'バラエティ', '/images/sweets/gift.jpg', 'そごう', false, false, true
FROM channels c, categories cat
WHERE c.code = 'department' AND cat.slug = 'western'
ON CONFLICT (code) DO NOTHING;

INSERT INTO products (code, channel_id, category_id, name, description, image_url, purchase_hint, is_new, is_limited_period, is_store_limited)
SELECT 'd18', c.id, cat.id, 'カステラ 特選', '長崎風', '/images/sweets/wagashi.jpg', '博多阪急', false, false, true
FROM channels c, categories cat
WHERE c.code = 'department' AND cat.slug = 'wagashi'
ON CONFLICT (code) DO NOTHING;

INSERT INTO products (code, channel_id, category_id, name, description, image_url, purchase_hint, is_new, is_limited_period, is_store_limited)
SELECT 'd19', c.id, cat.id, 'プリン 詰合せ', '冷蔵ギフト', '/images/sweets/gift.jpg', '横浜高島屋', false, false, true
FROM channels c, categories cat
WHERE c.code = 'department' AND cat.slug = 'western'
ON CONFLICT (code) DO NOTHING;

INSERT INTO products (code, channel_id, category_id, name, description, image_url, purchase_hint, is_new, is_limited_period, is_store_limited)
SELECT 'd20', c.id, cat.id, '干菓子 セット', 'お茶請け', '/images/sweets/wagashi.jpg', '京都・高島屋', false, false, true
FROM channels c, categories cat
WHERE c.code = 'department' AND cat.slug = 'wagashi'
ON CONFLICT (code) DO NOTHING;

INSERT INTO products (code, channel_id, category_id, name, description, image_url, purchase_hint, is_new, is_limited_period, is_store_limited)
SELECT 'd21', c.id, cat.id, 'トリュフ チョコ', '高級チョコ', '/images/sweets/chocolate.jpg', '銀座・松屋', false, false, true
FROM channels c, categories cat
WHERE c.code = 'department' AND cat.slug = 'chocolate'
ON CONFLICT (code) DO NOTHING;

INSERT INTO products (code, channel_id, category_id, name, description, image_url, purchase_hint, is_new, is_limited_period, is_store_limited)
SELECT 'd22', c.id, cat.id, '苺大福 詰合せ', '季節限定', '/images/sweets/wagashi.jpg', '春・伊勢丹', true, true, true
FROM channels c, categories cat
WHERE c.code = 'department' AND cat.slug = 'wagashi'
ON CONFLICT (code) DO NOTHING;

INSERT INTO products (code, channel_id, category_id, name, description, image_url, purchase_hint, is_new, is_limited_period, is_store_limited)
SELECT 'd23', c.id, cat.id, 'マドレーヌ ギフト', '焼き菓子', '/images/sweets/cookie.jpg', '名古屋・松坂屋', false, false, true
FROM channels c, categories cat
WHERE c.code = 'department' AND cat.slug = 'western'
ON CONFLICT (code) DO NOTHING;

INSERT INTO products (code, channel_id, category_id, name, description, image_url, purchase_hint, is_new, is_limited_period, is_store_limited)
SELECT 'd24', c.id, cat.id, '最中 12個入', '贈答', '/images/sweets/wagashi.jpg', '日本橋三越', false, false, true
FROM channels c, categories cat
WHERE c.code = 'department' AND cat.slug = 'wagashi'
ON CONFLICT (code) DO NOTHING;

INSERT INTO products (code, channel_id, category_id, name, description, image_url, purchase_hint, is_new, is_limited_period, is_store_limited)
SELECT 'd25', c.id, cat.id, 'サブレ 詰合せ', 'バター風味', '/images/sweets/cookie.jpg', '大丸', false, false, true
FROM channels c, categories cat
WHERE c.code = 'department' AND cat.slug = 'cookie'
ON CONFLICT (code) DO NOTHING;

INSERT INTO products (code, channel_id, category_id, name, description, image_url, purchase_hint, is_new, is_limited_period, is_store_limited)
SELECT 'd26', c.id, cat.id, '和菓子 月替わり', '限定', '/images/sweets/wagashi.jpg', '高島屋', true, true, true
FROM channels c, categories cat
WHERE c.code = 'department' AND cat.slug = 'wagashi'
ON CONFLICT (code) DO NOTHING;

-- tags link
INSERT INTO product_tags (product_id, tag_id)
SELECT p.id, t.id FROM products p, tags t
WHERE p.code = 'c1' AND t.name = 'ポテチ'
ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id)
SELECT p.id, t.id FROM products p, tags t
WHERE p.code = 'c1' AND t.name = 'スナック'
ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id)
SELECT p.id, t.id FROM products p, tags t
WHERE p.code = 'c1' AND t.name = '100円以下'
ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id)
SELECT p.id, t.id FROM products p, tags t
WHERE p.code = 'c2' AND t.name = 'ポテチ'
ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id)
SELECT p.id, t.id FROM products p, tags t
WHERE p.code = 'c2' AND t.name = 'スナック'
ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id)
SELECT p.id, t.id FROM products p, tags t
WHERE p.code = 'c3' AND t.name = 'ポテチ'
ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id)
SELECT p.id, t.id FROM products p, tags t
WHERE p.code = 'c3' AND t.name = 'スナック'
ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id)
SELECT p.id, t.id FROM products p, tags t
WHERE p.code = 'c4' AND t.name = 'ポテチ'
ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id)
SELECT p.id, t.id FROM products p, tags t
WHERE p.code = 'c4' AND t.name = '期間限定'
ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id)
SELECT p.id, t.id FROM products p, tags t
WHERE p.code = 'c5' AND t.name = 'チョコ'
ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id)
SELECT p.id, t.id FROM products p, tags t
WHERE p.code = 'c5' AND t.name = '100円以下'
ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id)
SELECT p.id, t.id FROM products p, tags t
WHERE p.code = 'c6' AND t.name = 'クッキー'
ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id)
SELECT p.id, t.id FROM products p, tags t
WHERE p.code = 'c7' AND t.name = 'ポテチ'
ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id)
SELECT p.id, t.id FROM products p, tags t
WHERE p.code = 'c7' AND t.name = 'スポンサー'
ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id)
SELECT p.id, t.id FROM products p, tags t
WHERE p.code = 'd1' AND t.name = 'ギフト'
ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id)
SELECT p.id, t.id FROM products p, tags t
WHERE p.code = 'd1' AND t.name = 'チョコ'
ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id)
SELECT p.id, t.id FROM products p, tags t
WHERE p.code = 'd2' AND t.name = 'ギフト'
ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id)
SELECT p.id, t.id FROM products p, tags t
WHERE p.code = 'd2' AND t.name = '和菓子'
ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id)
SELECT p.id, t.id FROM products p, tags t
WHERE p.code = 'd3' AND t.name = 'ギフト'
ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id)
SELECT p.id, t.id FROM products p, tags t
WHERE p.code = 'd3' AND t.name = 'チョコ'
ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id)
SELECT p.id, t.id FROM products p, tags t
WHERE p.code = 'd4' AND t.name = 'ギフト'
ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id)
SELECT p.id, t.id FROM products p, tags t
WHERE p.code = 'd4' AND t.name = '期間限定'
ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id)
SELECT p.id, t.id FROM products p, tags t
WHERE p.code = 'd5' AND t.name = 'ギフト'
ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id)
SELECT p.id, t.id FROM products p, tags t
WHERE p.code = 'd5' AND t.name = '和菓子'
ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id)
SELECT p.id, t.id FROM products p, tags t
WHERE p.code = 'd6' AND t.name = 'ギフト'
ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id)
SELECT p.id, t.id FROM products p, tags t
WHERE p.code = 'd6' AND t.name = 'スポンサー'
ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id)
SELECT p.id, t.id FROM products p, tags t
WHERE p.code = 'c8' AND t.name = '100円以下'
ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id)
SELECT p.id, t.id FROM products p, tags t
WHERE p.code = 'c9' AND t.name = '100円以下'
ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id)
SELECT p.id, t.id FROM products p, tags t
WHERE p.code = 'c10' AND t.name = '100円以下'
ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id)
SELECT p.id, t.id FROM products p, tags t
WHERE p.code = 'c11' AND t.name = '100円以下'
ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id)
SELECT p.id, t.id FROM products p, tags t
WHERE p.code = 'c12' AND t.name = '100円以下'
ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id)
SELECT p.id, t.id FROM products p, tags t
WHERE p.code = 'c13' AND t.name = '100円以下'
ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id)
SELECT p.id, t.id FROM products p, tags t
WHERE p.code = 'c14' AND t.name = '100円以下'
ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id)
SELECT p.id, t.id FROM products p, tags t
WHERE p.code = 'c15' AND t.name = '100円以下'
ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id)
SELECT p.id, t.id FROM products p, tags t
WHERE p.code = 'c16' AND t.name = '100円以下'
ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id)
SELECT p.id, t.id FROM products p, tags t
WHERE p.code = 'c17' AND t.name = '100円以下'
ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id)
SELECT p.id, t.id FROM products p, tags t
WHERE p.code = 'c18' AND t.name = '100円以下'
ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id)
SELECT p.id, t.id FROM products p, tags t
WHERE p.code = 'c19' AND t.name = '100円以下'
ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id)
SELECT p.id, t.id FROM products p, tags t
WHERE p.code = 'c20' AND t.name = '100円以下'
ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id)
SELECT p.id, t.id FROM products p, tags t
WHERE p.code = 'c21' AND t.name = '100円以下'
ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id)
SELECT p.id, t.id FROM products p, tags t
WHERE p.code = 'c22' AND t.name = '100円以下'
ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id)
SELECT p.id, t.id FROM products p, tags t
WHERE p.code = 'c23' AND t.name = '100円以下'
ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id)
SELECT p.id, t.id FROM products p, tags t
WHERE p.code = 'c24' AND t.name = '100円以下'
ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id)
SELECT p.id, t.id FROM products p, tags t
WHERE p.code = 'c25' AND t.name = '100円以下'
ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id)
SELECT p.id, t.id FROM products p, tags t
WHERE p.code = 'c26' AND t.name = '100円以下'
ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id)
SELECT p.id, t.id FROM products p, tags t
WHERE p.code = 'c27' AND t.name = '100円以下'
ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id)
SELECT p.id, t.id FROM products p, tags t
WHERE p.code = 'c28' AND t.name = '100円以下'
ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id)
SELECT p.id, t.id FROM products p, tags t
WHERE p.code = 'c29' AND t.name = '100円以下'
ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id)
SELECT p.id, t.id FROM products p, tags t
WHERE p.code = 'c30' AND t.name = '100円以下'
ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id)
SELECT p.id, t.id FROM products p, tags t
WHERE p.code = 'c31' AND t.name = '100円以下'
ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id)
SELECT p.id, t.id FROM products p, tags t
WHERE p.code = 'c32' AND t.name = '100円以下'
ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id)
SELECT p.id, t.id FROM products p, tags t
WHERE p.code = 'c33' AND t.name = '100円以下'
ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id)
SELECT p.id, t.id FROM products p, tags t
WHERE p.code = 'c34' AND t.name = '100円以下'
ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id)
SELECT p.id, t.id FROM products p, tags t
WHERE p.code = 'd7' AND t.name = 'ギフト'
ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id)
SELECT p.id, t.id FROM products p, tags t
WHERE p.code = 'd8' AND t.name = 'ギフト'
ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id)
SELECT p.id, t.id FROM products p, tags t
WHERE p.code = 'd9' AND t.name = 'ギフト'
ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id)
SELECT p.id, t.id FROM products p, tags t
WHERE p.code = 'd10' AND t.name = 'ギフト'
ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id)
SELECT p.id, t.id FROM products p, tags t
WHERE p.code = 'd11' AND t.name = 'ギフト'
ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id)
SELECT p.id, t.id FROM products p, tags t
WHERE p.code = 'd12' AND t.name = 'ギフト'
ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id)
SELECT p.id, t.id FROM products p, tags t
WHERE p.code = 'd13' AND t.name = 'ギフト'
ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id)
SELECT p.id, t.id FROM products p, tags t
WHERE p.code = 'd14' AND t.name = 'ギフト'
ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id)
SELECT p.id, t.id FROM products p, tags t
WHERE p.code = 'd15' AND t.name = 'ギフト'
ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id)
SELECT p.id, t.id FROM products p, tags t
WHERE p.code = 'd16' AND t.name = 'ギフト'
ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id)
SELECT p.id, t.id FROM products p, tags t
WHERE p.code = 'd17' AND t.name = 'ギフト'
ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id)
SELECT p.id, t.id FROM products p, tags t
WHERE p.code = 'd18' AND t.name = 'ギフト'
ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id)
SELECT p.id, t.id FROM products p, tags t
WHERE p.code = 'd19' AND t.name = 'ギフト'
ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id)
SELECT p.id, t.id FROM products p, tags t
WHERE p.code = 'd20' AND t.name = 'ギフト'
ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id)
SELECT p.id, t.id FROM products p, tags t
WHERE p.code = 'd21' AND t.name = 'ギフト'
ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id)
SELECT p.id, t.id FROM products p, tags t
WHERE p.code = 'd22' AND t.name = 'ギフト'
ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id)
SELECT p.id, t.id FROM products p, tags t
WHERE p.code = 'd23' AND t.name = 'ギフト'
ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id)
SELECT p.id, t.id FROM products p, tags t
WHERE p.code = 'd24' AND t.name = 'ギフト'
ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id)
SELECT p.id, t.id FROM products p, tags t
WHERE p.code = 'd25' AND t.name = 'ギフト'
ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id)
SELECT p.id, t.id FROM products p, tags t
WHERE p.code = 'd26' AND t.name = 'ギフト'
ON CONFLICT DO NOTHING;

-- trend scores
INSERT INTO trend_scores (product_id, channel_id, score, score_date)
SELECT p.id, c.id, 98, CURRENT_DATE FROM products p, channels c
WHERE p.code = 'c1' AND c.code = 'convenience'
ON CONFLICT (product_id, channel_id, score_date) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO trend_scores (product_id, channel_id, score, score_date)
SELECT p.id, c.id, 92, CURRENT_DATE FROM products p, channels c
WHERE p.code = 'c2' AND c.code = 'convenience'
ON CONFLICT (product_id, channel_id, score_date) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO trend_scores (product_id, channel_id, score, score_date)
SELECT p.id, c.id, 88, CURRENT_DATE FROM products p, channels c
WHERE p.code = 'c3' AND c.code = 'convenience'
ON CONFLICT (product_id, channel_id, score_date) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO trend_scores (product_id, channel_id, score, score_date)
SELECT p.id, c.id, 91, CURRENT_DATE FROM products p, channels c
WHERE p.code = 'c4' AND c.code = 'convenience'
ON CONFLICT (product_id, channel_id, score_date) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO trend_scores (product_id, channel_id, score, score_date)
SELECT p.id, c.id, 90, CURRENT_DATE FROM products p, channels c
WHERE p.code = 'c5' AND c.code = 'convenience'
ON CONFLICT (product_id, channel_id, score_date) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO trend_scores (product_id, channel_id, score, score_date)
SELECT p.id, c.id, 87, CURRENT_DATE FROM products p, channels c
WHERE p.code = 'c6' AND c.code = 'convenience'
ON CONFLICT (product_id, channel_id, score_date) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO trend_scores (product_id, channel_id, score, score_date)
SELECT p.id, c.id, 80, CURRENT_DATE FROM products p, channels c
WHERE p.code = 'c7' AND c.code = 'convenience'
ON CONFLICT (product_id, channel_id, score_date) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO trend_scores (product_id, channel_id, score, score_date)
SELECT p.id, c.id, 96, CURRENT_DATE FROM products p, channels c
WHERE p.code = 'd1' AND c.code = 'department'
ON CONFLICT (product_id, channel_id, score_date) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO trend_scores (product_id, channel_id, score, score_date)
SELECT p.id, c.id, 94, CURRENT_DATE FROM products p, channels c
WHERE p.code = 'd2' AND c.code = 'department'
ON CONFLICT (product_id, channel_id, score_date) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO trend_scores (product_id, channel_id, score, score_date)
SELECT p.id, c.id, 91, CURRENT_DATE FROM products p, channels c
WHERE p.code = 'd3' AND c.code = 'department'
ON CONFLICT (product_id, channel_id, score_date) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO trend_scores (product_id, channel_id, score, score_date)
SELECT p.id, c.id, 89, CURRENT_DATE FROM products p, channels c
WHERE p.code = 'd4' AND c.code = 'department'
ON CONFLICT (product_id, channel_id, score_date) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO trend_scores (product_id, channel_id, score, score_date)
SELECT p.id, c.id, 86, CURRENT_DATE FROM products p, channels c
WHERE p.code = 'd5' AND c.code = 'department'
ON CONFLICT (product_id, channel_id, score_date) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO trend_scores (product_id, channel_id, score, score_date)
SELECT p.id, c.id, 83, CURRENT_DATE FROM products p, channels c
WHERE p.code = 'd6' AND c.code = 'department'
ON CONFLICT (product_id, channel_id, score_date) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO trend_scores (product_id, channel_id, score, score_date)
SELECT p.id, c.id, 85, CURRENT_DATE FROM products p, channels c
WHERE p.code = 'c8' AND c.code = 'convenience'
ON CONFLICT (product_id, channel_id, score_date) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO trend_scores (product_id, channel_id, score, score_date)
SELECT p.id, c.id, 84, CURRENT_DATE FROM products p, channels c
WHERE p.code = 'c9' AND c.code = 'convenience'
ON CONFLICT (product_id, channel_id, score_date) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO trend_scores (product_id, channel_id, score, score_date)
SELECT p.id, c.id, 82, CURRENT_DATE FROM products p, channels c
WHERE p.code = 'c10' AND c.code = 'convenience'
ON CONFLICT (product_id, channel_id, score_date) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO trend_scores (product_id, channel_id, score, score_date)
SELECT p.id, c.id, 81, CURRENT_DATE FROM products p, channels c
WHERE p.code = 'c11' AND c.code = 'convenience'
ON CONFLICT (product_id, channel_id, score_date) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO trend_scores (product_id, channel_id, score, score_date)
SELECT p.id, c.id, 80, CURRENT_DATE FROM products p, channels c
WHERE p.code = 'c12' AND c.code = 'convenience'
ON CONFLICT (product_id, channel_id, score_date) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO trend_scores (product_id, channel_id, score, score_date)
SELECT p.id, c.id, 79, CURRENT_DATE FROM products p, channels c
WHERE p.code = 'c13' AND c.code = 'convenience'
ON CONFLICT (product_id, channel_id, score_date) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO trend_scores (product_id, channel_id, score, score_date)
SELECT p.id, c.id, 78, CURRENT_DATE FROM products p, channels c
WHERE p.code = 'c14' AND c.code = 'convenience'
ON CONFLICT (product_id, channel_id, score_date) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO trend_scores (product_id, channel_id, score, score_date)
SELECT p.id, c.id, 77, CURRENT_DATE FROM products p, channels c
WHERE p.code = 'c15' AND c.code = 'convenience'
ON CONFLICT (product_id, channel_id, score_date) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO trend_scores (product_id, channel_id, score, score_date)
SELECT p.id, c.id, 76, CURRENT_DATE FROM products p, channels c
WHERE p.code = 'c16' AND c.code = 'convenience'
ON CONFLICT (product_id, channel_id, score_date) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO trend_scores (product_id, channel_id, score, score_date)
SELECT p.id, c.id, 75, CURRENT_DATE FROM products p, channels c
WHERE p.code = 'c17' AND c.code = 'convenience'
ON CONFLICT (product_id, channel_id, score_date) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO trend_scores (product_id, channel_id, score, score_date)
SELECT p.id, c.id, 74, CURRENT_DATE FROM products p, channels c
WHERE p.code = 'c18' AND c.code = 'convenience'
ON CONFLICT (product_id, channel_id, score_date) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO trend_scores (product_id, channel_id, score, score_date)
SELECT p.id, c.id, 73, CURRENT_DATE FROM products p, channels c
WHERE p.code = 'c19' AND c.code = 'convenience'
ON CONFLICT (product_id, channel_id, score_date) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO trend_scores (product_id, channel_id, score, score_date)
SELECT p.id, c.id, 72, CURRENT_DATE FROM products p, channels c
WHERE p.code = 'c20' AND c.code = 'convenience'
ON CONFLICT (product_id, channel_id, score_date) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO trend_scores (product_id, channel_id, score, score_date)
SELECT p.id, c.id, 71, CURRENT_DATE FROM products p, channels c
WHERE p.code = 'c21' AND c.code = 'convenience'
ON CONFLICT (product_id, channel_id, score_date) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO trend_scores (product_id, channel_id, score, score_date)
SELECT p.id, c.id, 70, CURRENT_DATE FROM products p, channels c
WHERE p.code = 'c22' AND c.code = 'convenience'
ON CONFLICT (product_id, channel_id, score_date) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO trend_scores (product_id, channel_id, score, score_date)
SELECT p.id, c.id, 69, CURRENT_DATE FROM products p, channels c
WHERE p.code = 'c23' AND c.code = 'convenience'
ON CONFLICT (product_id, channel_id, score_date) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO trend_scores (product_id, channel_id, score, score_date)
SELECT p.id, c.id, 68, CURRENT_DATE FROM products p, channels c
WHERE p.code = 'c24' AND c.code = 'convenience'
ON CONFLICT (product_id, channel_id, score_date) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO trend_scores (product_id, channel_id, score, score_date)
SELECT p.id, c.id, 67, CURRENT_DATE FROM products p, channels c
WHERE p.code = 'c25' AND c.code = 'convenience'
ON CONFLICT (product_id, channel_id, score_date) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO trend_scores (product_id, channel_id, score, score_date)
SELECT p.id, c.id, 66, CURRENT_DATE FROM products p, channels c
WHERE p.code = 'c26' AND c.code = 'convenience'
ON CONFLICT (product_id, channel_id, score_date) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO trend_scores (product_id, channel_id, score, score_date)
SELECT p.id, c.id, 65, CURRENT_DATE FROM products p, channels c
WHERE p.code = 'c27' AND c.code = 'convenience'
ON CONFLICT (product_id, channel_id, score_date) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO trend_scores (product_id, channel_id, score, score_date)
SELECT p.id, c.id, 64, CURRENT_DATE FROM products p, channels c
WHERE p.code = 'c28' AND c.code = 'convenience'
ON CONFLICT (product_id, channel_id, score_date) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO trend_scores (product_id, channel_id, score, score_date)
SELECT p.id, c.id, 63, CURRENT_DATE FROM products p, channels c
WHERE p.code = 'c29' AND c.code = 'convenience'
ON CONFLICT (product_id, channel_id, score_date) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO trend_scores (product_id, channel_id, score, score_date)
SELECT p.id, c.id, 62, CURRENT_DATE FROM products p, channels c
WHERE p.code = 'c30' AND c.code = 'convenience'
ON CONFLICT (product_id, channel_id, score_date) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO trend_scores (product_id, channel_id, score, score_date)
SELECT p.id, c.id, 61, CURRENT_DATE FROM products p, channels c
WHERE p.code = 'c31' AND c.code = 'convenience'
ON CONFLICT (product_id, channel_id, score_date) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO trend_scores (product_id, channel_id, score, score_date)
SELECT p.id, c.id, 60, CURRENT_DATE FROM products p, channels c
WHERE p.code = 'c32' AND c.code = 'convenience'
ON CONFLICT (product_id, channel_id, score_date) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO trend_scores (product_id, channel_id, score, score_date)
SELECT p.id, c.id, 59, CURRENT_DATE FROM products p, channels c
WHERE p.code = 'c33' AND c.code = 'convenience'
ON CONFLICT (product_id, channel_id, score_date) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO trend_scores (product_id, channel_id, score, score_date)
SELECT p.id, c.id, 58, CURRENT_DATE FROM products p, channels c
WHERE p.code = 'c34' AND c.code = 'convenience'
ON CONFLICT (product_id, channel_id, score_date) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO trend_scores (product_id, channel_id, score, score_date)
SELECT p.id, c.id, 82, CURRENT_DATE FROM products p, channels c
WHERE p.code = 'd7' AND c.code = 'department'
ON CONFLICT (product_id, channel_id, score_date) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO trend_scores (product_id, channel_id, score, score_date)
SELECT p.id, c.id, 81, CURRENT_DATE FROM products p, channels c
WHERE p.code = 'd8' AND c.code = 'department'
ON CONFLICT (product_id, channel_id, score_date) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO trend_scores (product_id, channel_id, score, score_date)
SELECT p.id, c.id, 80, CURRENT_DATE FROM products p, channels c
WHERE p.code = 'd9' AND c.code = 'department'
ON CONFLICT (product_id, channel_id, score_date) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO trend_scores (product_id, channel_id, score, score_date)
SELECT p.id, c.id, 79, CURRENT_DATE FROM products p, channels c
WHERE p.code = 'd10' AND c.code = 'department'
ON CONFLICT (product_id, channel_id, score_date) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO trend_scores (product_id, channel_id, score, score_date)
SELECT p.id, c.id, 78, CURRENT_DATE FROM products p, channels c
WHERE p.code = 'd11' AND c.code = 'department'
ON CONFLICT (product_id, channel_id, score_date) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO trend_scores (product_id, channel_id, score, score_date)
SELECT p.id, c.id, 77, CURRENT_DATE FROM products p, channels c
WHERE p.code = 'd12' AND c.code = 'department'
ON CONFLICT (product_id, channel_id, score_date) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO trend_scores (product_id, channel_id, score, score_date)
SELECT p.id, c.id, 76, CURRENT_DATE FROM products p, channels c
WHERE p.code = 'd13' AND c.code = 'department'
ON CONFLICT (product_id, channel_id, score_date) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO trend_scores (product_id, channel_id, score, score_date)
SELECT p.id, c.id, 75, CURRENT_DATE FROM products p, channels c
WHERE p.code = 'd14' AND c.code = 'department'
ON CONFLICT (product_id, channel_id, score_date) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO trend_scores (product_id, channel_id, score, score_date)
SELECT p.id, c.id, 74, CURRENT_DATE FROM products p, channels c
WHERE p.code = 'd15' AND c.code = 'department'
ON CONFLICT (product_id, channel_id, score_date) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO trend_scores (product_id, channel_id, score, score_date)
SELECT p.id, c.id, 73, CURRENT_DATE FROM products p, channels c
WHERE p.code = 'd16' AND c.code = 'department'
ON CONFLICT (product_id, channel_id, score_date) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO trend_scores (product_id, channel_id, score, score_date)
SELECT p.id, c.id, 72, CURRENT_DATE FROM products p, channels c
WHERE p.code = 'd17' AND c.code = 'department'
ON CONFLICT (product_id, channel_id, score_date) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO trend_scores (product_id, channel_id, score, score_date)
SELECT p.id, c.id, 71, CURRENT_DATE FROM products p, channels c
WHERE p.code = 'd18' AND c.code = 'department'
ON CONFLICT (product_id, channel_id, score_date) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO trend_scores (product_id, channel_id, score, score_date)
SELECT p.id, c.id, 70, CURRENT_DATE FROM products p, channels c
WHERE p.code = 'd19' AND c.code = 'department'
ON CONFLICT (product_id, channel_id, score_date) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO trend_scores (product_id, channel_id, score, score_date)
SELECT p.id, c.id, 69, CURRENT_DATE FROM products p, channels c
WHERE p.code = 'd20' AND c.code = 'department'
ON CONFLICT (product_id, channel_id, score_date) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO trend_scores (product_id, channel_id, score, score_date)
SELECT p.id, c.id, 68, CURRENT_DATE FROM products p, channels c
WHERE p.code = 'd21' AND c.code = 'department'
ON CONFLICT (product_id, channel_id, score_date) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO trend_scores (product_id, channel_id, score, score_date)
SELECT p.id, c.id, 67, CURRENT_DATE FROM products p, channels c
WHERE p.code = 'd22' AND c.code = 'department'
ON CONFLICT (product_id, channel_id, score_date) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO trend_scores (product_id, channel_id, score, score_date)
SELECT p.id, c.id, 66, CURRENT_DATE FROM products p, channels c
WHERE p.code = 'd23' AND c.code = 'department'
ON CONFLICT (product_id, channel_id, score_date) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO trend_scores (product_id, channel_id, score, score_date)
SELECT p.id, c.id, 65, CURRENT_DATE FROM products p, channels c
WHERE p.code = 'd24' AND c.code = 'department'
ON CONFLICT (product_id, channel_id, score_date) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO trend_scores (product_id, channel_id, score, score_date)
SELECT p.id, c.id, 64, CURRENT_DATE FROM products p, channels c
WHERE p.code = 'd25' AND c.code = 'department'
ON CONFLICT (product_id, channel_id, score_date) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO trend_scores (product_id, channel_id, score, score_date)
SELECT p.id, c.id, 63, CURRENT_DATE FROM products p, channels c
WHERE p.code = 'd26' AND c.code = 'department'
ON CONFLICT (product_id, channel_id, score_date) DO UPDATE SET score = EXCLUDED.score;

-- sponsors
DELETE FROM sponsor_slots;
INSERT INTO sponsor_slots (product_id, channel_id, display_order)
SELECT p.id, c.id, 1 FROM products p, channels c WHERE p.code = 'c7' AND c.code = 'convenience';
INSERT INTO sponsor_slots (product_id, channel_id, display_order)
SELECT p.id, c.id, 1 FROM products p, channels c WHERE p.code = 'd6' AND c.code = 'department';

COMMIT;
-- Total products: 60