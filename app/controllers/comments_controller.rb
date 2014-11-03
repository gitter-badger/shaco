class CommentsController < ApplicationController
  before_action :find_article, only: [:create, :new, :destroy]

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user = current_user
    @comment.article = @article
    if @comment.save
      redirect_to article_path(@comment.article)
    else
      render 'form'
    end
  end

  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    redirect_to article_path(@article)
  end

  private
    def comment_params
      params.require(:comment).permit(:body)
    end

    def find_article
      @article = Article.find(params[:article_id])
    end
end
