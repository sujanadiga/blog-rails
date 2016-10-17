class ArticlesController < ApplicationController
  before_action :get_article, only: [:update, :show, :edit, :destroy]

  def index
    @q = Article.ransack(params[:q])
    @articles = @q.result.includes(:user).paginate(page: params[:page], per_page: 5).order(updated_at: :desc)
    @q.build_condition
    @q.build_sort if @q.sorts.empty?
  end

  def new
    @article = current_user.articles.new
  end

  def create
    @article = current_user.articles.new(article_params)
    if @article.save
      flash[:notice] = 'Article created successfully'
      redirect_to @article
    else
      render 'new'
    end

  end

  def update
    if @article.update(article_params)
      flash[:notice] = 'Article updated successfully'
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
    flash[:notice] = 'Article deleted successfully'
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