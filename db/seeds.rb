# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# seedデータの作成
action = Genre.create!(name: "アクション")
rpg = Genre.create!(name: "RPG")
card = Genre.create!(name: "カード")
board = Genre.create!(name: "ボードゲーム")

game1 = Game.create!(title: "ゲーム1", description: "ゲーム1の説明")
game2 = Game.create!(title: "ゲーム2", description: "ゲーム2の説明")

action.games << game1
rpg.games << game1
card.games << game2
board.games << game2