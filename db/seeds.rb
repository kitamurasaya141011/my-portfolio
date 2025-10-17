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


# ----------------------------------
# EmploymentType データの作成 (Roleの下に追記)
# ----------------------------------
employment_types = [
  { name: '正社員' },
  { name: '契約社員' },
  # 必要に応じて追加
]

employment_types.each do |type_data|
  EmploymentType.find_or_create_by!(name: type_data[:name])
end

puts "EmploymentTypeデータを作成または更新しました。"


# ----------------------------------
# 1. 最初の管理者アカウントの作成
# ----------------------------------

admin_role = Role.find_by(name: '事務局')

# ここでは'正社員'という名前の雇用形態が必要であると仮定します。
default_employment_type = EmploymentType.find_by(name: '正社員')

unless admin_role && default_employment_type
  puts " 警告: '事務局' Role または '正社員' EmploymentType が見つかりません。先にこれらのデータを作成してください。"
  return
end


# Userの共通情報を保存（usersテーブルの null: false カラムに値を設定）
admin_user = User.find_or_create_by!(email: 'system_admin@example.com') do |user|
  # has_secure_password の要件を満たすパスワード
  user.password              = 'InitialAdminPass123!'
  user.password_confirmation = 'InitialAdminPass123!'

  # usersテーブル - 共通情報 (すべて null: false)
  user.last_name             = 'システム'
  user.first_name            = '管理者'
  user.last_name_kana        = 'システム'
  user.first_name_kana       = 'カンリシャ'
  user.role                  = admin_role # Roleモデルの関連付け
  user.gender                = 0          # default: 0
  user.phone_mobile          = '000-0000-0000'
  user.phone_emergency       = '000-0000-0000'
  user.phone_home            = '000-0000-0000'
  user.emergency_contact_name = 'システム連絡先'
  user.emergency_contact_relationship = '本人'
  user.address               = '東京都未設定'
  user.date_of_birth         = Date.new(1980, 1, 1)
end

puts "User: 管理者アカウント (#{admin_user.email}) の作成を完了しました。"


# ----------------------------------
# 2. Admin 固有情報の作成
# ----------------------------------

# Userがすでに Admin レコードを持っていない場合のみ作成
unless admin_user.admin
  # create_admin! を使用して、users.id を user_id として adminsテーブルに保存
  admin_user.create_admin!(
    # adminsテーブル固有の項目 (すべて null: false)
    employee_number: 'A99999',
    years_of_service: 5,
    date_of_hire: Date.new(2020, 4, 1),
    education: '大学卒業',
    is_on_leave: false, # default: false
    employment_type: default_employment_type # employment_type_id 関連付け

    # date_of_retirement, previous_job は nullを許容するため省略可能
  )
  puts "Admin: 固有プロフィールの作成を完了しました。"
else
  puts "ℹ️ Admin: 固有プロフィールは既に存在します。"
end
