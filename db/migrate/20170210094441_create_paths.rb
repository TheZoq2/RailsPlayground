class CreatePaths < ActiveRecord::Migration
  def change
    create_table :paths do |t|
      t.integer :first_location_id
      t.integer :second_location_id

      t.timestamps null: false
    end
  end
end
