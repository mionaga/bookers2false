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
    @user=@book.user
  end

  def edit
  end

  def index
    @books=Book.all
    @user=@books.user
  end
  
  def destroy
    book = Book.find(params[:id])
    book.destry
    redirect_to '/books'
  end


 private

  def book_params
    params.require(:book).permit(:title, :image, :body)
  end
end
