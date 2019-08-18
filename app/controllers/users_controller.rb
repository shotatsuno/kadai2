class UsersController < ApplicationController
  def show
     @user = User.find(params[:id])
     @book = Book.new
     @books = @user.books
   end
    
  def top
  end

  def edit
  	@user = current_user
    user = User.find(params[:id])
    if @user.id != user.id
      redirect_to user_path(@user)
    end
  end 

  def index
  	 @user = current_user
     @book = Book.new
     @users = User.all
  end

  def update
  	@user = current_user
  	if @user.update(user_params)
        flash[:notice]="You have updated user successfully"
  	    redirect_to user_path(current_user)
    else
    render :edit
    end
  end

  private
  def user_params
  	params.require(:user).permit(:name, :profile_image, :introduction)
  end
end
