class CreateTeachers < ActiveRecord::Migration[8.0]
  def change
    create_table :teachers do |t|
      t.references :user, null: false, foreign_key: true
      t.string :faculty_name #学部
      t.string :department_name #学科
      t.string :employee_number #教員番号
      t.integer :years_of_service
      t.date :date_of_hire
      t.string :previous_job #前職
      t.string :education #学歴
      t.string :employment_type #雇用形態
      t.boolean :is_on_leave, default: false

      t.timestamps
    end
  end
end
