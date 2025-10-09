class CreateStudentAffiliations < ActiveRecord::Migration[8.0]
  def change
    create_table :student_affiliations do |t|
      t.references :student, null: false, foreign_key: true
      t.references :department, null: false, foreign_key: true

      # 履歴の期間を管理
      t.date :start_date, null: false
      t.date :end_date
      # 同じ学生が同じ学科に同時に複数回在籍しないことを保証
      t.index [:student_id, :department_id, :start_date], unique: true

      t.timestamps
    end
  end
end
