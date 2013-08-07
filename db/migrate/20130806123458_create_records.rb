class CreateRecords < ActiveRecord::Migration
  def change
    create_table :records do |t|
      t.string :client
      t.string :ue
      t.string :imei
      t.float :lat
      t.float :lon
      t.float :distance
      t.date :date
      t.datetime :last_time

      t.timestamps
    end
  end
end
