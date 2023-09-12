class UsersController < ApplicationController
  before_action :is_matching_login_user, only: [:edit]

  def index
    @users = User.all
    @user = current_user
    @book = Book.new
  end

  def show
    @book = Book.new
    @books = Book.where(user_id:params[:id])
    @user = User.find(params[:id])
  end

  def edit
    user = User.find(params[:id])
    unless user.id == current_user.id
    redirect_to books_path
    end
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    if @user.update(user_params)
      flash[:notice] =  "You have updated user successfully."
      redirect_to user_path
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

  def is_matching_login_user
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to user_path(current_user)
    end
  end

end
