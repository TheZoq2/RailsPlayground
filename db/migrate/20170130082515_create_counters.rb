class CreateCounters < ActiveRecord::Migration
  def change
    create_table :counters do |t|
      t.integer :counter

      t.timestamps null: false
    end
  end
end
