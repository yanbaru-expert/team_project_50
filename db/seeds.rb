# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
email = 'test@example.com'
password = 'password'

# テストユーザーが存在しないときだけ作成
User.find_or_create_by!(email: email) do |user|
  user.password = password
  puts 'ユーザーの初期データインポートに成功しました。'
end

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
# AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?
admin_email = "admin@example.com"
AdminUser.find_or_create_by!(email: admin_email) do |adminuser|
  adminuser.password = password
  adminuser.password_confirmation = password
  puts "管理者ユーザーの初期データインポートに成功しました。"
end
