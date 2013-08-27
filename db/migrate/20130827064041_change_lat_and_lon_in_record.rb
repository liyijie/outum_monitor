class ChangeLatAndLonInRecord < ActiveRecord::Migration
  def up
    change_column :records, :lat, :decimal
    change_column :records, :lon, :decimal
  end

  def down
    change_column :records, :lat, :float
    change_column :records, :lon, :float
  end
end
