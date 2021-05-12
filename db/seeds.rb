# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "csv"

Text.destroy_all
CSV.foreach("db/csv_data/text_data.csv", headers: true) do |row|
  Text.create(row.to_h)
end
puts "テキスト教材の初期データインポート完了！"

Movie.destroy_all
CSV.foreach("db/csv_data/movie_data.csv", headers: true) do |row|
  Movie.create(row.to_h)
end
puts "動画教材の初期データインポート完了！"