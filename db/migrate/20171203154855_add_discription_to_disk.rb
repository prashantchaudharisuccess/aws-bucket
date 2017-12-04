class AddDiscriptionToDisk < ActiveRecord::Migration[5.1]
  def change
    add_column :disks, :discription, :string
  end
end
