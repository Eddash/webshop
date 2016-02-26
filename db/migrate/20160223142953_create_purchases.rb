class CreatePurchases < ActiveRecord::Migration
  def change
    create_table :purchases do |t|
      t.integer :whisky_id
      t.integer :buyer_id
      t.timestamps
    end
    add_index :purchases, [:whisky_id, :buyer_id], unique: true
  end
end
