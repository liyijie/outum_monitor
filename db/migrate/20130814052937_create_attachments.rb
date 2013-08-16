class CreateAttachments < ActiveRecord::Migration
  def change
    create_table :attachments do |t|
      t.string :media
      t.string :content_type
      t.string :file_name
      t.integer :file_size
      t.integer :attachmentable_id
      t.string :attachmentable_type

      t.timestamps
    end
  end
end
