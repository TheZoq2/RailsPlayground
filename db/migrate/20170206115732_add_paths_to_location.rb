class AddPathsToLocation < ActiveRecord::Migration
  def change
    add_reference :locations, :location, index: true
    add_foreign_key :locations, :locations
  end
end
