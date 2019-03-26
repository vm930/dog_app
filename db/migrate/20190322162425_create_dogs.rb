class CreateDogs < ActiveRecord::Migration[5.2]
  def change
    create_table :dogs do |t|
      t.string :username
      t.string :password_digest
      t.string :name
      t.string :gender
      t.string :breed
      t.string :color
      t.integer :age
      t.string :personality
      t.string :size
      t.string :location

      t.timestamps
    end
  end
end
