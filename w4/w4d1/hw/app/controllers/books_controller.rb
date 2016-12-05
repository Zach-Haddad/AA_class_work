class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def new
    # it works even if nothing is here?
  end

  def create
    @book = Book.new(book_params)
    @book.save!
    redirect_to books_url
  end

  def destroy
    @book = Book.find_by(id: params[:id])
    @book.delete
    redirect_to books_url
  end

  private
  def book_params
    params.require(:book).permit(:title, :author)
  end
end
