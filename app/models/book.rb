class Book < ActiveRecord::Base
  default_scope :order => "title"
  has_many :cart_items
  
  before_destroy :ensure_not_referenced_by_any_cart_item
  
  validates :title, :author, :edition, :isbn, :cover, :description, :price, :copy_right_year, :presence => true
  validates_uniqueness_of :title, :case_sensitive => false
  validates_length_of :title, :maximum => 150
  validates_length_of :author, :maximum => 255
  validates_length_of :copy_right_year, :maximum => 4
  validates_length_of :isbn, :maximum => 50
  validates_length_of :description, :maximum => 50
  validates_format_of :cover, :with => %r{\.(gif|jpg|png)$}i, :message => "only accepts GIF, JGP, PNG formats"
  validates_numericality_of :price, :greater_than_or_equal_to => 1, :message => "must greater than 1"
  
  private
    def ensure_not_referenced_by_any_cart_item
      if cart_items.count.zero?
        return true
      else
        errors.add(:base, "Cart Items present")
        return false
      end
    end
end