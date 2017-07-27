class BooksController < ApplicationController
  before_action :find_book, only: [:show, :destroy, :update, :edit]
  before_action :authorize, except: [:show, :index]

  def index
    @books = Book.all
    # render json: @books
  end

  def new
    @book = Book.new

  end

  def edit
    @book
  end

  def create
    @book = Book.new(book_params)
    @book[:user_id] = current_user.id
    if @book.save
      redirect_to books_path
    else
      flash ("Book not saved")
      redirect_to new_book_path
    end
  end

  def show
    @book
  end

  def destroy
    @book.destroy
    redirect_to books_path
  end

  def update
    @book.update(book_params)
    redirect_to books_path
  end

  private
  def book_params
    params.require(:book).permit(:title, :author, :description, :url)
  end

  def find_book
    @book = Book.find(params[:id])
  end
end