class ApplicationController < ActionController::Base
#タイムライン用のインスタンスを持ってくる
	def timeline
		@rs = Review.all
	end

end
