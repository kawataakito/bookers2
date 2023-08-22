class UsersController < ApplicationController


  def show
    @book = Book.new
    @user = User.find(params[:id])
    @books = @user.books
  end

  def edit
    @user = User.find(params[:id])
    unless @user.id == current_user.id
      redirect_to current_user
    end
  end
  
  def update
    @user = User.find(params[:id])
    unless @user.id == current_user.id
      redirect_to current_user
    end
    if @user.update(user_params)
    redirect_to user_path(@user.id)
    flash[:notice] = "successfully" 
    else
      render :edit
    end
  end

  def index
    @users = User.all
    @user = current_user
    @book = Book.new
  end

   private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

end