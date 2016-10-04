class ArticlesController < ApplicationController
  before_filter :authenticate_user!
  before_action :get_article, only: [:update, :show, :edit, :destroy]

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to @article
    else
      render 'new'
    end

  end

  def update
    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end

  def show
  end

  def edit
  end

  def destroy
    @article.destroy
    redirect_to articles_path
  end

  private
    def article_params
      params.require(:article).permit(:title, :text)
    end

    def get_article
      @article = Article.find(params[:id])
    end
end