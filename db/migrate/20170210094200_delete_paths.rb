class DeletePaths < ActiveRecord::Migration
  def up
    drop_table :paths
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
