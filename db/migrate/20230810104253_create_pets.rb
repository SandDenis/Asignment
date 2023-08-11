class CreatePets < ActiveRecord::Migration[7.0]
  def change
    create_table :pets, id: :bigint do |t|
      t.string :name , null: false
      t.string :breed, null: false
      t.integer :health, null: false, default: 100
      t.integer :happiness, null: false, default: 0
      t.integer :hunger, null: false, default: 100
      t.bigint :user_id
      t.timestamps
    end

    add_foreign_key :pets , :users
  end

end
