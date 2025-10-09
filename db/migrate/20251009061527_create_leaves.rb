class CreateLeaves < ActiveRecord::Migration[8.0]
  def change
    create_table :leaves do |t|
      t.references :user, null: false, foreign_key: true
      # 休務期間
      t.date :start_date, null: false
      t.date :end_date
      t.timestamps
    end
  end
end
