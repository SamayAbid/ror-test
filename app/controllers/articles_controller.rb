class ArticlesController < ApplicationController
  before_action :authenticate_publisher!, exccept: %i[index show]
  # before_action :correct_user , only:[:edit,:update,:destroy]

  def index
    # @articles = Article.all
    @articles = current_publisher.articles
  end

  def new
    @article = Article.new
    # @article = current_publisher.articles.build
  end

  def create
    @article = Article.new(article_params)
    # @article = current_publisher.articles.build(article_params)

    if @article.save
      redirect_to @article
    else
      render :new
    end
  end

  def show
    @article = Article.find(params[:id])
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render :edit
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to articles_path
  end

  def correct_user
    @article = current_publisher.articles.find_by(params[:id])
    redirect_to articles_path
  end

  def table
    @articles = current_publisher.articles
  end

  private

  def article_params
    params.require(:article).permit(:title, :description, :publisher_id)
  end
end
