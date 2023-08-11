class CreateFood < ActiveRecord::Migration[7.0]
  def change
    create_table :foods, id: :bigint do |t|
      t.string :name, null: false
      t.integer :foodometer, null: false
      t.timestamps
    end
  end
end
