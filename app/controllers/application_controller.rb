class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_search
  include SessionsHelper

  def set_search
    @q = Book.search(params[:q])
    @students = @q.result(distinct: true).page(params[:page])
  end

  private

  # ユーザーのログインを確認する
  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
  end

end