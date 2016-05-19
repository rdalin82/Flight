class CreateFlights < ActiveRecord::Migration
  def change
    create_table :flights do |t|
      t.datetime :start
      t.integer :duration
      t.references :from_airport, index: true, foreign_key: true
      t.references :to_airport, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
