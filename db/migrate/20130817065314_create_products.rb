class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :version
      t.string :release_note
      t.date :release_date
      t.string :attachment
      t.boolean :statble
      t.integer :download_count

      t.timestamps
    end
  end
end
