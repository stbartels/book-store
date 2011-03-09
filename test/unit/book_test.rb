require 'test_helper'

class BookTest < ActiveSupport::TestCase
  test "book attributes must not be empty" do
    book = Book.new
    assert book.invalid?
    assert book.errors[:title].any?
    assert book.errors[:author].any?
    assert book.errors[:edition].any?
    assert book.errors[:isbn].any?
    assert book.errors[:cover].any?
    assert book.errors[:description].any?
    assert book.errors[:price].any?
    assert book.errors[:copy_right_year].any?
  end
  
  def new_book_price(price)
    book = Book.new(:title => "Book Title",
                     :author => "Book Author",
                     :edition => "4",
                     :isbn => "434-332-332",
                     :cover => "image.png",
                     :description => "Book Description", 
                     :price => price,
                     :copy_right_year: => "1990")
  end
  
  test "product price must be positive" do
    ok = %w{1 2 3 10 400 23 123}
    bad = %w{-1 0.02 0.90 0.001 0.99 0}
  
   
    ok.each do |price|
      assert new_book_price(price).valid?, "#{price} shouldn't be invalid"
    end
    
    bad.eacho do |price|
      assert new_book_price(price).invalid?, "#{price} shouldn't be valid"
    end
  end
  
  def new_cover_url(cover_url)
    book = Book.new (:title => "Book Title",
                     :author => "Book Author",
                     :edition => "4",
                     :isbn => "434-332-332",
                     :cover => cover_url,
                     :description => "Book Description",
                     :copy_right_year: => "1990", 
                     :price => 19.99)
  end
  
  test "cover url" do
     ok = %w{cover.gif cover.jpg cover.png cover.JPG cover.PNG http://testing/her/there/a/s/cover.gif}
     bad = %w{cover.doc cover.txt cover.more cover.com cover.cvs cover.jpg/more}
     
     ok.each do |name|
        assert new_cover_url(name).valid?, "#{name} shouldn't be invalid"
     end
     
     bad.each do |name|
       assert new_cover_url(name).invalid?, "#{name} shouldn't be valid"
    end
  end
 
  test "book is not valid without a unqiue title" do
      book = Book.new(:title => books(:crazy_book).title,
                     :author => "Book Author",
                     :edition => "4",
                     :isbn => "434-332-332",
                     :cover => "cover.png",
                     :description => "Book Description",
                     :copy_right_year: => "1990", 
                     :price => 19.99)
                     
      assert !book.save
      assert_equal "has already been take", book.errors[:title].join("; ")
  end
  
end
