class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :note
      t.string :title

      t.timestamps
    end
  end
end
