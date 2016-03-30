class CreateCases < ActiveRecord::Migration
  def change
    create_table :cases do |t|
      t.string :name
      t.text :body
      t.integer :lawyer_id

      t.timestamps null: false
    end
  end
end
