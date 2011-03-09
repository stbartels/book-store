class HomeController < ApplicationController
  def index
    @books = Book.all
  end

  def show
  end

end
