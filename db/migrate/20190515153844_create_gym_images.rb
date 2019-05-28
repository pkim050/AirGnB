class CreateGymImages < ActiveRecord::Migration[5.2]
  def change
    create_table :gym_images do |t|
      t.string :caption
      t.integer :picture_order
      t.attachment :picture

      t.timestamps
    end
  end
end
