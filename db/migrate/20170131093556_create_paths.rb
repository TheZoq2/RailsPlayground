class CreatePaths < ActiveRecord::Migration
  def change
    create_table :paths do |t|
      t.integer :start
      t.integer :end

      t.timestamps null: false
    end
  end
end
