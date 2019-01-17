class CommentsController < ApplicationController
  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(comment_params)
    if @comment.persisted?
      redirect_to article_path(@article)
    else 
      redirect_to article_path(@article), notice: "Please fill in comment"
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:body, :user_id)
    end
end