class CreateDisks < ActiveRecord::Migration[5.1]
  def change
    create_table :disks do |t|
      t.string :attachment

      t.timestamps
    end
  end
end
