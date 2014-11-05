class ArticlesController < ApplicationController
  before_action :article_find, only: [:edit, :update, :destroy, :show]
  load_and_authorize_resource only: [:update, :edit, :destroy]
  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def edit
  end

  def create
    @article = Article.new(article_params)
    @article.user = current_user
    if @article.save
      redirect_to @article
    else
      render 'new'
    end
  end

  def show
  end

  def update
    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    @article.destroy
    redirect_to articles_path
  end

  private
    def article_params
      params.require(:article).permit(:title, :text)
    end

    def article_find
      @article = Article.find(params[:id])
    end
end
