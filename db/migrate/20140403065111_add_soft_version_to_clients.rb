class AddSoftVersionToClients < ActiveRecord::Migration
  def change
    add_column :clients, :soft_version, :string
  end
end
