class DashboardController < ApplicationController
  before_action :authenticate_user!
  
  def index
  end

  def articles
    @articles = Article.all
  end

  def article_details
    @article = Article.find(params[:id])
  end
end
