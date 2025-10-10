class CreateFaculties < ActiveRecord::Migration[8.0]
  def change
    create_table :faculties do |t|
      t.string :name, null: false, index: { unique: true }
      t.string :display_name
      t.timestamps
    end
  end
end
