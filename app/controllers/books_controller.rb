class BooksController < ApplicationController
	def create
    @user=current_user
    @books = Book.all
		@book = Book.new(book_params)
		@book.user_id = current_user.id
		if @book.save
      flash[:notice]="Book is successfully created"
		redirect_to book_path(@book.id)
    else
      render :index
    end
	end

  def index
  	@user=current_user
  	@books=Book.all
  	@book = Book.new
  end

  def show
    @users = User.all
    @book = Book.new
    @books = Book.find(params[:id])
    @user = @books.user
  end

  def edit
    @user = current_user
    @book = Book.find(params[:id])
    if @user.id != @book.user_id
      redirect_to books_path
    end
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
          flash[:notice]="Book was successfully Updated."
          redirect_to book_path(@book)
      else
          render :edit
      end
  end

  def destroy
    @book=Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  def about
  end

	 private

  def book_params
      params.require(:book).permit(:title, :body)
  end


end
