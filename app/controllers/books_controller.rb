class BooksController < ApplicationController
  
  #表示する場所はbooks/id,books,users/id,users,
  #def new
    #@books=Book.new
  #end  
  
  # 投稿データの保存
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to books_path(books.id)
  end
  
  def show
  end

  def edit
  end

  def index
    @books=Book.all
  end


 private

  def book_params
    params.require(:book).permit(:title, :image, :body)
  end
end
