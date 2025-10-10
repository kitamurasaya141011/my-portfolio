class CreateUsers < ActiveRecord::Migration[8.0]
  def change
    create_table :users do |t|
      t.string :last_name, null: false
      t.string :first_name, null: false
      t.string :last_name_kana, null: false
      t.string :first_name_kana, null: false
      t.string :email, index: true, null: false
      t.string :password_digest, null: false
      t.integer :gender, null: false, default: 0 # Integer型で性別を定義
      t.string :phone_mobile, null: false # 三種類の電話番号
      t.string :phone_emergency, null: false # 緊急連絡先
      t.string :phone_home, null: false
      t.string :emergency_contact_name, null: false # 緊急連絡先の氏名
      t.string :emergency_contact_relationship, null: false # 緊急連絡先の続柄
      t.string :address, null: false
      t.date :date_of_birth, null: false
      t.references :users, :role, foreign_key: true, null: false, index: true

      t.timestamps
    end
  end
end
