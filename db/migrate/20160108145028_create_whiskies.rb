class CreateWhiskies < ActiveRecord::Migration
  def change
    create_table :whiskies do |t|
      t.string :name
      t.integer :old
      t.float :price
      t.float :liter
      t.string :land
      t.float :volume
      t.string :description
      t.string :pic_url

      t.timestamps null: false
    end
  end
end
