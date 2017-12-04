class CreateCoffers < ActiveRecord::Migration[5.1]
  def change
    create_table :coffers do |t|
      t.integer :user_id
      t.string :asset_name
      t.string :asset_type
      t.integer :asset_size
      t.string :asset_info
      t.datetime :date
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
