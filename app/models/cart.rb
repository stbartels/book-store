class Cart < ActiveRecord::Base
  has_many :cart_items, :dependent => :destroy
  
  def add_product(book_id, price)
    current_item = cart_items.find_by_book_id(book_id)
    if current_item
      current_item.quantity += 1
    else
      current_item = cart_items.build(:book_id => book_id, :product_price => price)
      
    end
    current_item
  end
  
end
