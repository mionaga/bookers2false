class UsersController < ApplicationController

  def create
    @user=User.new
    @user.save
  end

  def show
    @user =User.find(params[:id])
    @books = @user.books
    @book = Book.new
  end

  def edit
    @user=User.find(params[:id])
  end

  def update
    @user =User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end



  def index
    @users = User.all
    @user=current_user
  end




private

  def user_params
    params.require(:user).permit(:name, :body, :profile_image)
  end


end