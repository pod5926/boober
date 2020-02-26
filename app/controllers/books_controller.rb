class BooksController < ApplicationController
  before_action :logged_in_user, only: [:index, :create, :destroy, :show]
  before_action :correct_user,   only: :destroy

  def index
  end

  def show
    @book = Book.find(params[:id])
  rescue ActiveRecord::RecordNotFound # 削除したときの遷移
    redirect_to root_url
  end

  def create
    @book = current_user.books.build(book_params)
    if @book.save
      flash[:success] = I18n.t "bookshelf.controller.created!"
      redirect_to root_url
    else
      @feed_items = []
      render 'static_pages/home'
    end
  end

  def destroy
    @book.destroy
    flash[:success] = I18n.t "bookshelf.controller.Book deleted"
    redirect_back(fallback_location: root_url)
  end

  private

  def book_params
    params.require(:book).permit(:title, :content, :picture)
  end

  def correct_user
    @book = current_user.books.find_by(id: params[:id])
    redirect_to root_url if @book.nil?
  end
end
