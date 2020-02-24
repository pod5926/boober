class StaticPagesController < ApplicationController
  def home
    if logged_in?
      @book = current_user.books.build
      @feed_items = current_user.feed.page(params[:page]).per(10)
    end
  end

  def help
  end

  def about
  end

  def test
  end
end
