class AddUserIdToDisk < ActiveRecord::Migration[5.1]
  def change
    add_column :disks, :user_id, :ineteger
  end
end
