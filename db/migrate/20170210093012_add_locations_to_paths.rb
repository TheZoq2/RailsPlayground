class AddLocationsToPaths < ActiveRecord::Migration
  def change
      remove_column :paths, :start
      remove_column :paths, :end
  end
end
