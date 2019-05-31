class CreateGyms < ActiveRecord::Migration[5.2]
  def change
    create_table :gyms do |t|
      t.string :name
      t.text :description
      t.string :address_1
      t.string :address_2
      t.string :city
      t.string :state
      t.integer :guests
      t.float :price
      t.integer :owner_id

      t.timestamps
    end
  end
end
