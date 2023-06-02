class CreateBarberShops < ActiveRecord::Migration[7.0]
  def change
    create_table :barber_shops do |t|
      t.string :name, null: false
      t.string :address, null: false

      t.timestamps
    end
  end
end
