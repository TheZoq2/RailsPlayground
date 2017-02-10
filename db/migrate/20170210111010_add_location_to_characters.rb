class AddLocationToCharacters < ActiveRecord::Migration
  def change
    add_reference :characters, :location, index: true
    add_foreign_key :characters, :location
  end
end
