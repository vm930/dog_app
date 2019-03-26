class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :username
      t.string :password_digest
      t.string :full_name
      t.integer :age
      t.string :occupation
      t.string :bio
      t.string :location

      t.timestamps
    end
  end
end
