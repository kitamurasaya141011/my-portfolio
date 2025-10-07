class CreateUsers < ActiveRecord::Migration[8.0]
  def change
    create_table :users do |t|
      t.string :last_name
      t.string :first_name
      t.string :last_name_kana
      t.string :first_name_kana
      t.string :email, index: true
      t.string :password_digest
      t.integer :gender, null: false, default: 0 # Integer型で性別を定義
      t.string :phone_mobile #三種類の電話番号
      t.string :phone_emergency #緊急連絡先
      t.string :phone_home
      t.string :emergency_contact_name #緊急連絡先の氏名
      t.string :emergency_contact_relationship #緊急連絡先の続柄
      t.string :address
      t.date :date_of_birth
      t.string :role

      t.timestamps
    end
  end
end
