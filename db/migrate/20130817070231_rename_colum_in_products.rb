class RenameColumInProducts < ActiveRecord::Migration
  def up
    rename_column :products, :version, :release_version
  end

  def down
    rename_column :products, :release_version, :version
  end
end
