class UserController < ApplicationController
  def show_user
    @user = User.find(params["user_id"].to_i)
  end
end
