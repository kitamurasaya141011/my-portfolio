# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
#
# ----------------------------------
# Role（役割・権限）データの作成
# ----------------------------------
roles = [
  { name: '学生' },
  { name: '教員' },
  { name: '事務局' }
]

roles.each do |role_data|
  # nameが一致するRoleがなければ、新しく作成する
  Role.find_or_create_by!(name: role_data[:name]) do |role|
    #role.code = role_data[:code]
  end
end

puts "Roleデータを作成または更新しました。"
