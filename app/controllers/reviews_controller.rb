class ReviewsController < ApplicationController
  
  def new
  	@book = Book.find(params[:book_id])
  	@review = Review.new
  end

  def create
  	@review = Review.new(params_review)
  	if @review.save
  		redirect_to books_path
  	else
  		redirect_to new_book_review_path
  	end
  end

  def edit
  	@review = Review.find(params[:id])
  end

  def update
  end


  private
  def params_review
  	params.require(:review).permit(:editor,  :review, :rank, :book_id)
  end
end
