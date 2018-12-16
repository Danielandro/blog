class CommentsController < ApplicationController
  def create
    # keep track of article comment is related to  
    @article = Article.find(params[:article_id])
    # create + save comment. Links comment to article.
    @comment = @article.comments.create(comment_params)
    # redirect to show view
    redirect_to article_path(@article)
  end

  def destroy
    # find article by id
    @article = Article.find(params[:article_id])
    # check comments collection for comment via id
    @comment = @article.comments.find(params[:id])
    # delete comment
    @comment.destroy
    # redirect to article page
    redirect_to article_path(@article)
  end

  private
    # Comment cannot be empty. Accept commenter & body parameters only
    def comment_params
      params.require(:comment).permit(:commenter, :body)
    end
end
