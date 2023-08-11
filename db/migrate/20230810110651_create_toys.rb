class CreateToys < ActiveRecord::Migration[7.0]
  def change
    create_table :toys, id: :bigint do |t|
      t.string :name, null: false
      t.integer :happiness, null: false
      t.bigint :pet_id
      t.timestamps
    end

    add_foreign_key :toys, :pets
  end
end
