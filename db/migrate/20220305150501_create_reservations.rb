class CreateReservations < ActiveRecord::Migration[7.0]
  def change
    create_table :reservations do |t|
      t.integer :room_id
      t.references :user
      t.datetime :start_date
      t.datetime :end_date
      t.integer :people
      t.integer :price

      t.timestamps
    end
  end
end
