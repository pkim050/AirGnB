class CreateReservations < ActiveRecord::Migration[5.2]
  def change
    create_table :reservations do |t|
      t.date :start_date
      t.date :end_date
      t.integer :user_id
      t.integer :gym_id

      t.timestamps
    end
  end
end
