class UsersController < ApplicationController
  before_action :timeline
  before_action :authenticate_user!
  def show
  #current_userを使うので、User.find(current_user.id)はいらないようだ
  end
end
