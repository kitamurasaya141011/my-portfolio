class CreateAdmins < ActiveRecord::Migration[8.0]
  def change
    create_table :admins do |t| 
      t.references :user, null: false, foreign_key: true
      t.string :employee_number, null:false # 社員番号（文字が入る場合もあるのでstring）
      t.integer :years_of_service, null: false # 勤務年数
      t.date :date_of_hire, null: false # 入社年
      t.date :date_of_retirement # 退社年
      t.string :previous_job #前職
      t.string :education, null: false # 学歴
      t.boolean :is_on_leave, default: false, null:false # 休職中か（デフォルトがfalse）
      t.references :admins, :employment_type, foreign_key: true, null: false
      t.timestamps
    end
  end
end
