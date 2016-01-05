class CommentsController < ApplicationController
def create
  @article = Article.find(params[:article_id])
  @comment = @article.comments.new(comment_params)
  @comment.user = current_user
  #@comment.save
  #redirect_to articles_path(@article)
  respond_to do |format|
      if @comment.save
        format.html { redirect_to @article, notice: 'Review was created successfully.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { redirect_to @article, alert: 'Review was not saved successfully.' }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
end

  def destroy
  end
  private

  def comment_params
    params.require(:comment).permit(:user_id, :body, :rating)
  end

  
end
