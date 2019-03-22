class CreateAppointments < ActiveRecord::Migration[5.2]
  def change
    create_table :appointments do |t|
      t.string :title
      t.string :category
      t.integer :dog_id
      t.integer :user_id
      t.string :location
      t.integer :price
      t.string :description

      t.timestamps
    end
  end
end
