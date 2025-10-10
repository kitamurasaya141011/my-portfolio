class CreateStudents < ActiveRecord::Migration[8.0]
  def change
    create_table :students do |t|
      t.references :user, null: false, foreign_key: true
      t.string :student_number,null: false #学籍番号
      t.integer :grade_level, null: false #学年
      t.string :parent_name, null: false
      t.string :relationship, null: false # 続柄
      t.date :date_of_admission, null:false # 入学日
      t.date :date_of_separation # 卒業日
      t.boolean :is_graduated, null: false

      t.timestamps
    end
  end
end
