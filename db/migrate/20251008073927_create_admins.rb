class CreateAdmins < ActiveRecord::Migration[8.0]
  def change
    create_table :admins do |t| 
      t.references :user, null: false, foreign_key: true
      t.string :employee_number # 社員番号（文字が入る場合もあるのでstring）
      t.integer :years_of_service # 勤務年数
      t.date :date_of_hire
      t.string :previous_job
      t.string :education # 学歴
      t.boolean :is_on_leave, default: false # 休職中か（デフォルトがfalse）
      t.string :employment_type, null: false, default: '正社員'# デフォルトを正社員とする

      t.timestamps
    end
  end
end
