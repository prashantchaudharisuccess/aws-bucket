class CreateProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :profiles do |t|
      t.string :first_name
      t.string :last_name
      t.string :phone_num
      t.string :email_id
      t.references :users, foreign_key: true

      t.timestamps
    end
  end
end
