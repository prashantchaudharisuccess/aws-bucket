class AddNameToDisk < ActiveRecord::Migration[5.1]
  def change
    add_column :disks, :name, :string
  end
end
