class AddProductPriceToCartItems < ActiveRecord::Migration
  def self.up
    add_column :cart_items, :product_price, :decimal, :precision => 10, :scale => 2
  end

  def self.down
    remove_column :cart_items, :product_price
  end
end
