class HomeController < ApplicationController
  def index
    @books = Book.all

    if session[:counter].nil?
      session[:counter]
    else
      session[:counter] += 1
    end
  end

  def show
    @book = Book.find(params[:books])
    
    respond_to do |format|
      format.html
      format.xml {render :xml => @book}
    end
  end

end
