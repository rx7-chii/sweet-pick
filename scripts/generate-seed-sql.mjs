/**
 * supabase/seed.sql を生成（52 商品）
 * 実行: node scripts/generate-seed-sql.mjs
 */

import { writeFileSync } from "node:fs";
import path from "node:path";
import { fileURLToPath } from "node:url";

const __dirname = path.dirname(fileURLToPath(import.meta.url));
const out = path.join(__dirname, "..", "supabase", "seed.sql");

const baseProducts = [
  ["c1","convenience","スナック","うすしおポテトチップス","今SNSで話題の定番薄味。","/images/sweets/chips.jpg","コンビニ全店",98,false,false,false,["ポテチ","スナック","100円以下"]],
  ["c2","convenience","スナック","スパイシーポテトスティック","ピリ辛がクセになる新定番。","/images/sweets/chips.jpg","セブン-イレブン",92,false,false,true,["ポテチ","スナック"]],
  ["c3","convenience","スナック","のりしおポテト","ごはんのお供にもなるコクうま味。","/images/sweets/chips.jpg","ファミリーマート",88,false,false,true,["ポテチ","スナック"]],
  ["c4","convenience","スナック","季節限定 さくらポテチ","春限定のほのかな桜風味。","/images/sweets/chips.jpg","ローソン",91,true,true,true,["ポテチ","期間限定"]],
  ["c5","convenience","チョコレート","ミルクチョコレートバー","なめらかな口どけの定番チョコ。","/images/sweets/chocolate.jpg","コンビニ全店",90,false,false,false,["チョコ","100円以下"]],
  ["c6","convenience","クッキー","塩バターサブレ","バターの風味が広がるサクサク食感。","/images/sweets/cookie.jpg","コンビニ全店",87,true,false,false,["クッキー"]],
  ["c7","convenience","スナック","プレミアムポテチ トリュフ風味","コンビニ限定の贅沢ポテチ。","/images/sweets/chips.jpg","セブン-イレブン",80,false,false,true,["ポテチ","スポンサー"]],
  ["d1","department","洋菓子","銀座の苺タルト","デパ地下で行列の人気スイーツ。","/images/sweets/gift.jpg","百貨店デパ地下",96,false,false,false,["ギフト","チョコ"]],
  ["d2","department","和菓子","季節の和菓子詰合せ","贈答に最適な上品な詰め合わせ。","/images/sweets/wagashi.jpg","高島屋デパ地下",94,false,false,true,["ギフト","和菓子"]],
  ["d3","department","チョコレート","ベルギー産チョコレート詰合せ","高級感あるチョコの定番ギフト。","/images/sweets/chocolate.jpg","三越デパ地下",91,false,false,true,["ギフト","チョコ"]],
  ["d4","department","洋菓子","マカロンアソート","インスタで話題のカラフルマカロン。","/images/sweets/candy.jpg","伊勢丹デパ地下",89,true,true,true,["ギフト","期間限定"]],
  ["d5","department","和菓子","老舗の最中セット","伝統と話題性を兼ね備えた贈答品。","/images/sweets/wagashi.jpg","日本橋三越",86,false,false,true,["ギフト","和菓子"]],
  ["d6","department","チョコレート","限定コラボ チョコレート","デパ地下限定のコラボ商品。","/images/sweets/chocolate.jpg","阪急うめだ本店",83,false,true,true,["ギフト","スポンサー"]],
];

const extraConvenience = [
  ["カルムーcho","チョコレート","人気の2層チョコ","/images/sweets/chocolate.jpg","ローソン",85],
  ["じゃがりこ サラダ","スナック","サクサクスティック","/images/sweets/chips.jpg","コンビニ全店",84],
  ["黒チョコクッキー","クッキー","コク深い定番","/images/sweets/cookie.jpg","ファミリーマート",82],
  ["宇治抹茶チョコ","チョコレート","抹茶の風味","/images/sweets/chocolate.jpg","セブン-イレブン",81],
  ["チョコパイ","洋菓子","ふわふわ定番","/images/sweets/cookie.jpg","コンビニ全店",80],
  ["かっぱえびせん","スナック","海老の風味","/images/sweets/chips.jpg","コンビニ全店",79],
  ["チーズおかき","スナック","チーズ風味","/images/sweets/chips.jpg","ローソン",78],
  ["白い恋人 ミニ","クッキー","北海道定番","/images/sweets/cookie.jpg","空港・駅ナカ",77],
  ["明治ミルクチョコ","チョコレート","定番板チョコ","/images/sweets/chocolate.jpg","コンビニ全店",76],
  ["きのこの山","チョコレート","形がかわいい","/images/sweets/chocolate.jpg","コンビニ全店",75],
  ["たけのこの里","チョコレート","サクサク食感","/images/sweets/chocolate.jpg","コンビニ全店",74],
  ["ラムネキャンディ","キャンディ","懐かしい味","/images/sweets/candy.jpg","コンビニ全店",73],
  ["グミ 巨峰","グミ","果汁感","/images/sweets/candy.jpg","ファミリーマート",72],
  ["カントリーマアム","クッキー","定番クッキー","/images/sweets/cookie.jpg","コンビニ全店",71],
  ["ポッキー チョコ","スナック","ロングスナック","/images/sweets/chips.jpg","コンビニ全店",70],
  ["アルフォート","チョコレート","ビスケット入り","/images/sweets/chocolate.jpg","セブン-イレブン",69],
  ["ブラックサンダー","チョコレート","コスパ良し","/images/sweets/chocolate.jpg","コンビニ全店",68],
  ["熟成チョコ","チョコレート","期間限定","/images/sweets/chocolate.jpg","ローソン",67,true,true],
  ["厚切りポテト","スナック","ボリューム感","/images/sweets/chips.jpg","セブン-イレブン",66],
  ["ハッピーターン","スナック","あまいスナック","/images/sweets/chips.jpg","コンビニ全店",65],
  ["コアラのマーチ","チョコレート","かわいい形","/images/sweets/chocolate.jpg","コンビニ全店",64],
  ["チョコボール","チョコレート","ピーナッツ入り","/images/sweets/chocolate.jpg","ファミリーマート",63],
  ["どら焼き","和菓子","コンビニ和菓子","/images/sweets/wagashi.jpg","ローソン",62],
  ["わらび餅","和菓子","みたらし風味","/images/sweets/wagashi.jpg","セブン-イレブン",61],
  ["シュークリーム","洋菓子","冷蔵スイーツ","/images/sweets/gift.jpg","ファミリーマート",60,true],
  ["メロンパン チョコ","洋菓子","新作","/images/sweets/cookie.jpg","ローソン",59,true],
  ["ソフトクリーム 風","アイス","期間限定","/images/sweets/candy.jpg","セブン-イレブン",58,true,true],
];

const extraDepartment = [
  ["フィナンシェ詰合せ","洋菓子","焼き菓子ギフト","/images/sweets/gift.jpg","松屋銀座",82],
  ["どら焼き 特選","和菓子","老舗の味","/images/sweets/wagashi.jpg","日本橋高島屋",81],
  ["ガトーショコラ","洋菓子","濃厚チョコ","/images/sweets/chocolate.jpg","伊勢丹",80],
  ["羊羹 特選","和菓子","贈答用","/images/sweets/wagashi.jpg","三越",79],
  ["クッキー アソート","クッキー","洋菓子詰合せ","/images/sweets/cookie.jpg","高島屋",78],
  ["抹茶ラングドシャ","洋菓子","抹茶スイーツ","/images/sweets/gift.jpg","京都・大丸",77],
  ["バウムクーヘン","洋菓子","層が美しい","/images/sweets/gift.jpg","JR 駅ナカ",76],
  ["桜餅 特選","和菓子","春限定","/images/sweets/wagashi.jpg","春・三越",75,true,true],
  ["モンブラン 個包装","洋菓子","栗スイーツ","/images/sweets/gift.jpg","阪神",74],
  ["赤ワイン チョコ","チョコレート","大人向け","/images/sweets/chocolate.jpg","神戸・大丸",73],
  ["和洋折衷 詰合せ","洋菓子","バラエティ","/images/sweets/gift.jpg","そごう",72],
  ["カステラ 特選","和菓子","長崎風","/images/sweets/wagashi.jpg","博多阪急",71],
  ["プリン 詰合せ","洋菓子","冷蔵ギフト","/images/sweets/gift.jpg","横浜高島屋",70],
  ["干菓子 セット","和菓子","お茶請け","/images/sweets/wagashi.jpg","京都・高島屋",69],
  ["トリュフ チョコ","チョコレート","高級チョコ","/images/sweets/chocolate.jpg","銀座・松屋",68],
  ["苺大福 詰合せ","和菓子","季節限定","/images/sweets/wagashi.jpg","春・伊勢丹",67,true,true],
  ["マドレーヌ ギフト","洋菓子","焼き菓子","/images/sweets/cookie.jpg","名古屋・松坂屋",66],
  ["最中 12個入","和菓子","贈答","/images/sweets/wagashi.jpg","日本橋三越",65],
  ["サブレ 詰合せ","クッキー","バター風味","/images/sweets/cookie.jpg","大丸",64],
  ["和菓子 月替わり","和菓子","限定","/images/sweets/wagashi.jpg","高島屋",63,true,true],
];

let cNum = 8;
let dNum = 7;
const products = [...baseProducts];

for (const [name, cat, desc, img, hint, score, isNew=false, isLimited=false] of extraConvenience) {
  products.push([`c${cNum++}`,"convenience",cat,name,desc,img,hint,score,isNew,isLimited,false,["100円以下"]]);
}
for (const [name, cat, desc, img, hint, score, isNew=false, isLimited=false] of extraDepartment) {
  products.push([`d${dNum++}`,"department",cat,name,desc,img,hint,score,isNew,isLimited,true,["ギフト"]]);
}

function esc(s) {
  return String(s).replace(/'/g, "''");
}

const categorySlug = {
  スナック: "snack",
  チョコレート: "chocolate",
  和菓子: "wagashi",
  クッキー: "cookie",
  洋菓子: "western",
  キャンディ: "candy",
  グミ: "gummy",
  アイス: "ice",
};

const lines = [
  "-- SWEET PICK seed data (auto-generated)",
  "BEGIN;",
  "",
  "INSERT INTO channels (code, name) VALUES",
  "  ('convenience', 'コンビニ'),",
  "  ('department', 'デパ地下')",
  "ON CONFLICT (code) DO NOTHING;",
  "",
  "INSERT INTO categories (name, slug) VALUES",
  "  ('スナック','snack'),('チョコレート','chocolate'),('和菓子','wagashi'),",
  "  ('クッキー','cookie'),('洋菓子','western'),('キャンディ','candy'),('グミ','gummy'),('アイス','ice')",
  "ON CONFLICT (slug) DO NOTHING;",
  "",
];

const allTags = new Set();
for (const p of products) p[11].forEach((t) => allTags.add(t));
lines.push("INSERT INTO tags (name) VALUES");
lines.push([...allTags].map((t) => `  ('${esc(t)}')`).join(",\n"));
lines.push("ON CONFLICT (name) DO NOTHING;");
lines.push("");

for (const p of products) {
  const [code, ch, cat, name, desc, img, hint, score, isNew, isLimited, isStore, tags] = p;
  lines.push(`INSERT INTO products (code, channel_id, category_id, name, description, image_url, purchase_hint, is_new, is_limited_period, is_store_limited)
SELECT '${code}', c.id, cat.id, '${esc(name)}', '${esc(desc)}', '${esc(img)}', '${esc(hint)}', ${isNew}, ${isLimited}, ${isStore}
FROM channels c, categories cat
WHERE c.code = '${ch}' AND cat.slug = '${categorySlug[cat] ?? "western"}'
ON CONFLICT (code) DO NOTHING;`);
  lines.push("");
}

lines.push("-- tags link");
for (const p of products) {
  const [code,,,,,,,,,,, tags] = p;
  for (const tag of tags) {
    lines.push(`INSERT INTO product_tags (product_id, tag_id)
SELECT p.id, t.id FROM products p, tags t
WHERE p.code = '${code}' AND t.name = '${esc(tag)}'
ON CONFLICT DO NOTHING;`);
  }
}
lines.push("");

lines.push("-- trend scores");
for (const p of products) {
  const [code, ch,,,,,, score] = p;
  lines.push(`INSERT INTO trend_scores (product_id, channel_id, score, score_date)
SELECT p.id, c.id, ${score}, CURRENT_DATE FROM products p, channels c
WHERE p.code = '${code}' AND c.code = '${ch}'
ON CONFLICT (product_id, channel_id, score_date) DO UPDATE SET score = EXCLUDED.score;`);
}
lines.push("");

lines.push("-- sponsors");
lines.push("DELETE FROM sponsor_slots;");
lines.push(`INSERT INTO sponsor_slots (product_id, channel_id, display_order)
SELECT p.id, c.id, 1 FROM products p, channels c WHERE p.code = 'c7' AND c.code = 'convenience';`);
lines.push(`INSERT INTO sponsor_slots (product_id, channel_id, display_order)
SELECT p.id, c.id, 1 FROM products p, channels c WHERE p.code = 'd6' AND c.code = 'department';`);
lines.push("");
lines.push("COMMIT;");
lines.push(`-- Total products: ${products.length}`);

writeFileSync(out, lines.join("\n"), "utf8");
console.log(`Wrote ${products.length} products to ${out}`);
