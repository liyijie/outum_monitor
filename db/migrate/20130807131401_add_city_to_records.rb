class AddCityToRecords < ActiveRecord::Migration
  def change
    add_column :records, :city, :string
  end
end
