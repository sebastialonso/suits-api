class CreateLawyers < ActiveRecord::Migration
  def change
    create_table :lawyers do |t|
      t.string :name
      t.string :specialty
      t.integer :age
      t.string :title

      t.timestamps null: false
    end
  end
end
