class CreateSkills < ActiveRecord::Migration[5.2]
  def change
    create_table :skills do |t|
      t.string :name
      t.integer :skill_level
      t.integer :appointment_id

      t.timestamps
    end
  end
end
