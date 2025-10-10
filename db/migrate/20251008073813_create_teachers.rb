class CreateTeachers < ActiveRecord::Migration[8.0]
  def change
    create_table :teachers do |t|
      t.references :user, null: false, foreign_key: true
      t.string :faculty_name, null:false  # 学部
      t.string :department_name, null: false # 学科
      t.string :employee_number, null: false # 教員番号
      t.integer :years_of_service, null: false
      t.date :date_of_hire, null: false
      t.string :previous_job # 前職
      t.string :education, null: false # 学歴
      t.string :employment_type, null: false # 雇用形態
      t.boolean :is_on_leave, default: false #休職中か（あとでマスタ化）

      t.timestamps
    end
  end
end
