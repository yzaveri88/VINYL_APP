class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.date :start_date
      t.date :end_date
      t.references :user, foreign_key: true, index: true
      t.references :record, foreign_key: true, index: true

      t.timestamps
    end
  end
end
