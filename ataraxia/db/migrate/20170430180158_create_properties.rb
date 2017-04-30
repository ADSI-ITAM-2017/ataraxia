class CreateProperties < ActiveRecord::Migration[5.0]
  def change
    create_table :properties do |t|
      t.string :name
      t.string :address
      t.string :description
      t.decimal :price
      t.boolean :available
      t.integer :lesee
      t.integer :distance
      t.boolean :elevator
      t.boolean :ground_floor
      t.boolean :pets_allowed
      t.boolean :furnished
      t.boolean :cleaning_service
      t.boolean :female_roomies
      t.boolean :male_roomies
      t.boolean :gym
      t.boolean :smoking_is_allowed
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
