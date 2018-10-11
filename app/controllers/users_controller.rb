class UsersController < ApplicationController
  before_action :timeline, :ranking
  before_action :authenticate_user!
  def show
  #current_userを使うので、User.find(current_user.id)はいらないようだ
  end
end
