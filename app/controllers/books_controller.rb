class BooksController < ApplicationController
  before_action :timeline

  def index
  	@books = Book.order("id DESC").page(params[:page]).per(10)
  end

  def show
  	@book = Book.find(params[:id])
  end

  def search
    @books = Book.where('title LIKE(?)', "%#{params[:keyword]}%").limit(20)
  end

 
end
