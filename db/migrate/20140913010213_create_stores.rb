class CreateStores < ActiveRecord::Migration
  def change
    create_table :stores do |t|
      t.string :product_name
      t.string :brand_name
      t.decimal :cost
      t.text :description
      t.string :color
      t.text :feature_1
      t.text :feature_2
      t.attachment :image
      
      t.timestamps
    end
  end
end
