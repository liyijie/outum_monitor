class ChangeLatAndLonDecimalInRecords < ActiveRecord::Migration
  def up
    change_column :records, :lat, :decimal, scale: 10
    change_column :records, :lon, :decimal, scale: 10
  end

  def down
    change_column :records, :lat, :decimal
    change_column :records, :lon, :decimal
  end
end
