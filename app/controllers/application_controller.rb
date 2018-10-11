class ApplicationController < ActionController::Base
#タイムライン用のインスタンスを持ってくる
  	def timeline
		@rs = Review.all
	end

#ランキング用のインスタンスの用意	
	def ranking
		book_ids=Review.group(:book_id).order("count_book_id DESC").limit(6).count(:book_id).keys
		@rankings= book_ids.map{ |id| Book.find(id) }
	end
end
