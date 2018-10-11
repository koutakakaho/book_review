class ReviewsController < ApplicationController
  before_action :timeline, :authenticate_user!, :ranking

  def new
  	@book = Book.find(params[:book_id])
  	@review = Review.new
  end

  def create
  	@book = Book.find(params[:book_id])
  	@review = Review.new(params_review)
  	if @review.save
  		redirect_to book_path(@book)
  	else
  		redirect_to new_book_review_path
  	end
  end

  def edit
  	@book = Book.find(params[:book_id])
  	@review = Review.find(params[:id])
  end

  def update
  	@book = Book.find(params[:book_id])
  	@review = Review.find(params[:id])
  	if @review.update(params_review)
  	#条件分岐
  		redirect_to book_path(@book)
  	else
  		redirect_to edit_book_review_path
  	end
  end

  def destroy
  	@book = Book.find(params[:book_id])
  	@review = Review.find(params[:id])
  	@review.destroy
  	redirect_to book_path(@book)
  end


  private
  def params_review
  	params.require(:review).permit(:editor,  :review, :rank, :book_id, :user_id)
  end
end
