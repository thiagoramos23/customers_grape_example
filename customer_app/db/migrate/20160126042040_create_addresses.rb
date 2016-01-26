class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :street
      t.integer :city_id
      t.string :zip_code

      t.timestamps null: false
    end
  end
end
