class FavoritesController < ApplicationController
  def create
    @favorite = Favorite.create(user_id: current_user.id, book_id: params[:book_id])
    @favorites = Favorite.where(book_id: params[:book_id])
    @books = Book.all
  end

  def destroy
    favorite = Favorite.find_by(user_id: current_user.id, book_id: params[:book_id])
    favorite.destroy
    @favorites = Favorite.where(book_id: params[:book_id])
    @books = Book.all
  end
end
