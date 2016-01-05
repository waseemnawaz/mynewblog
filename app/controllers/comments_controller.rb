class CommentsController < ApplicationController
def create
  @article = Article.find(params[:article_id])
  @comment = @article.comments.new(comment_params)
  @comment.user = current_user
  @comment.save
  redirect_to articles_path(@article)
end

  def destroy
  end
  private

  def comment_params
    params.require(:comment).permit(:user_id, :body, :rating)
  end

  
end
