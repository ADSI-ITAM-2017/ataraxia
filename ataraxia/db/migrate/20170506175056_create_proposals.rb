class CreateProposals < ActiveRecord::Migration[5.0]
  def change
    create_table :proposals do |t|
      t.string :property_id
      t.string :lesee_id
      t.string :user_id

      t.timestamps
    end
  end
end
