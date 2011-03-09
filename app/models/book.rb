class Book < ActiveRecord::Base
  validates :title, :author, :edition, :isbn, :cover, :description, :price, :copy_right_year, :presence => true
  validates_uniqueness_of :title, :case_sensitive => false
  validates_length_of :title, :maximum => 150
  validates_length_of :author, :maximum => 255
  validates_length_of :copy_right_year, :maximum => 4
  validates_length_of :isbn, :maximum => 50
  validates_length_of :description, :maximum => 50
  validates_format_of :cover, :with => %r{\.(gif|jpg|png)$}i, :message => "only accepts GIF, JGP, PNG formats"
end