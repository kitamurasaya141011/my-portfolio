class CreateDepartments < ActiveRecord::Migration[8.0]
  def change
    create_table :departments do |t|
      t.references :faculty, null: false, foreign_key: true
      t.string :name, null: false, index: true

      # 画面表示名
      t.string :display_name
      t.timestamps
    end
    add_index :departments, [:faculty_id, :name], unique: true
  end
end
