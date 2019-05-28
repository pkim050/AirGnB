class CreateAvailableDates < ActiveRecord::Migration[5.2]
  def change
    create_table :available_dates do |t|
      t.date :available_date
      t.integer :gym_id
      t.boolean :booked, default: false

      t.timestamps
    end
  end
end
