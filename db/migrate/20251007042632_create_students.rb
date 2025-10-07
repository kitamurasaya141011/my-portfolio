class CreateStudents < ActiveRecord::Migration[8.0]
  def change
    create_table :students do |t|
      t.string :student_number #学籍番号
      t.string :faculty_name #学部
      t.string :department_name #学科
      t.integer :grade_level #学年
      t.string :parent_name
      t.string :relationship
      t.boolean :is_graduated
      t.boolean :is_taking_a_break

      t.timestamps
    end
  end
end
