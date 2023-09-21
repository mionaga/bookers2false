class BooksController < ApplicationController



  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
     if @book.save
    redirect_to book_path(@book.id)
     else
       @books= Book.all
       render :index
     end
  end


  def show
    @book=Book.find(params[:id])
    @user=User.find(@book.user_id)
    
  end

  def edit
    @book=Book.find(params[:id])
  end

  def index
    @books=Book.all
    @user=current_user
    @book_new=Book.new
  end

  def destroy
    book = Book.find(params[:id])
    book.destry
    redirect_to books_path
  end


 private

  def book_params
    params.require(:book).permit(:title, :image, :body)
  end
end
