# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# seedデータの作成


Admin.create!(
   email: 'admin@admin',
   password: 'admins'
)

Customer.create!(
  email: 'example@example.com',
  password: 'password',
  name: '山田 太郎',
  birthday: Date.new(1990, 1, 1),
  post_code: '1234567',
  prefecture_code: '東京都',
  address: '渋谷区恵比寿南1-2-3',
  telephone: '0312345678'
)

Customer.create!(
  email: 'test@test.com',
  password: 'password',
  name: '佐藤 次郎',
  birthday: Date.new(1995, 2, 2),
  post_code: '9876543',
  prefecture_code: '大阪府',
  address: '大阪市中央区難波2-3-4',
  telephone: '0612345678'
)

Customer.create!(
email: 'sample@example.com',
password: 'password',
name: '田中 花子',
birthday: Date.new(1985, 3, 3),
post_code: '5432109',
prefecture_code: '京都府',
address: '京都市左京区一ノ瀬1-2-3',
telephone: '0751234567'
)

Customer.create!(
email: 'example2@example.com',
password: 'password',
name: '鈴木 太一',
birthday: Date.new(2000, 4, 4),
post_code: '4600001',
prefecture_code: '愛知県',
address: '名古屋市中区栄1-1-1',
telephone: '0521234567'
)

Game.create!(
  genre_id: 1,
  platform_id: 2,
  category_id: 3,
  game_title: '剣と魔法の世界',
  introduct_title: '『剣と魔法の世界』は世界中で人気があるオンラインゲームです！',
  introduct: 'プレイヤーはそれぞれのキャラクターを選び、剣と魔法の世界を冒険しましょう！クエストに挑戦したり、モンスターを倒したりしてレベルアップし、新しいアイテムを手に入れることができます。',
  good_introduct: '本格的なRPGゲームが好きな人にはぴったりのゲームです。他のプレイヤーと一緒にクエストに挑戦することもでき、協力して冒険するのも楽しいです。',
  bad_introduct: 'スタート時のチュートリアルが少し長いので、ゲームを始める前にしっかりと時間を確保する必要があります。',
  game_comment: 'このゲームは本当に楽しいです！友達と一緒にプレイするのがおすすめです。',
  overall_review: '『剣と魔法の世界』は、プレイヤーが思い通りの冒険を楽しめる、本格的なRPGゲームです。グラフィックやサウンドも素晴らしく、オンラインゲームファンには必見の作品です。',
  points: 69,
  release_date: Date.new(2010, 6, 1),
  price: 5900,
  customer_id: 1
)

Game.create!(
  genre_id: 3,
  platform_id: 1,
  category_id: 2,
  game_title: 'タイムスリップ戦国絵巻',
  introduct_title: '戦国時代にタイムスリップして、歴史を変えろ！',
  introduct: '戦国時代にタイムスリップし、歴史を変えることができるアドベンチャーゲーム。',
  good_introduct: '歴史を変えることができるシステムが面白い。',
  bad_introduct: 'ストーリーがあまり深くない。',
  overall_review: 'ストーリーがあまり深くないが、歴史を変えることができるシステムが面白い。',
  points: 56,
  release_date: Date.new(2022, 4, 20),
  price: 8800,
  customer_id: 2
)

Game.create!(
  genre_id: 1,
  platform_id: 2,
  category_id: 1,
  game_title: 'オーバーロードの冒険',
  introduct_title: 'オンラインゲームの最強プレイヤーが異世界に転生！？',
  introduct: 'オンラインゲームの最強プレイヤーが異世界に転生し、自らの最強プレイヤーとしての知識を活かして、冒険するアクションゲーム。',
  good_introduct: 'プレイヤーが好きなアバターを選択できるシステムが魅力的。',
  bad_introduct: 'ストーリーがあまり膨らんでいないため、物足りない。',
  overall_review: 'プレイヤーの好みによって分かれると思うが、アバター選択システムが魅力的。',
  points: 87,
  release_date: Date.new(2022, 3, 12),
  price: 1800,
  customer_id: 2
)

Game.create!(
  genre_id: 2,
  platform_id: 3,
  category_id: 3,
  game_title: "クエストファンタジア",
  introduct_title: "オリジナルのファンタジー世界を舞台にしたRPG！",
  introduct: "古代の遺跡を巡り、秘宝を探す冒険者たち。しかし、そこには凶悪なモンスターや謎の人物が待ち受けていた...",
  good_introduct: "美麗なグラフィックと重厚なストーリーが魅力的！",
  bad_introduct: "バグが多く、プレイ中に途中で強制終了することがある。",
  overall_review: "ストーリーや世界観は素晴らしいが、バグの多さが気になる。",
  points: 57,
  release_date: Date.new(2022, 5, 12),
  price: 5000,
  customer_id: 4
)

