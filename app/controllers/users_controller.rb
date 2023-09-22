class UsersController < ApplicationController
  before_action :is_matching_login_user, only: [:edit, :update]

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

  def is_matching_login_user
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to post_images_path
    end
  end


end