class BooksController < ApplicationController
    before_action :find_book, only: [:show, :destroy, :update, :edit]

    def index
        @books = Book.all
    end

    def new
        @book = Book.new
    end

    def create
        @book = Book.new(book_params)
        if @book.save
            redirect_to books_path
        else
            redirect_to new_book_path
        end
    end

    def show
        @book
    end

    def destroy
        @book.delete
        redirect_to books_path
    end

    def edit
        @book
    end

    def update
        @book.update
        redirect_to books_path
    end

    private

    def book_params
        params.require(:book).permit(:title, :author, :url, :description)
    end

    def find_book
        @book = Book.find(params[:id])
    end
end
