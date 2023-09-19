class BooksController < ApplicationController
  
  #表示する場所はbooks/id,books,users/id,users,
  #def new
    #@books=Book.new
  #end  
  
  
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to books_path(books.id)
  end
  
  def show
    @book=Book.find(params[:id])
  end

  def edit
  end

  def index
    @books=Book.all
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
