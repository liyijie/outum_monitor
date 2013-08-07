class RenameColumInRecords < ActiveRecord::Migration
  def up
    rename_column :records, :client, :client_id
  end

  def down
    rename_column :records, :client_id, :client
  end
end
