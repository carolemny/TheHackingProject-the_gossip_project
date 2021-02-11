class UsersController < ApplicationController
  def index
    @all_users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(first_name: params[:first_name], last_name: params[:last_name], city_id: params[:city], description: params[:description], email: params[:email], age: params[:age], password: params[:password])
    if @user.save
      flash[:notice] = "Super, tu es enregistré(e) !"
      redirect_to "/welcome"
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def show
    @user = User.find(params["id"].to_i)
    @city = City.find(@user.city_id).name
  end

  def update
  end

  def destroy
  end
end
