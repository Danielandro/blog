class ArticlesController < ApplicationController
  def new
  end

  def create
    # pass render a simple hash:
    # key = plain, value = params[:article].inspect
    # params method returns an ActionController::Parameters object
    # Can use this object to access keys of hash using strings or symbols (e.g. :article)
    # render plain: params[:article].inspect

    # Article model initialized with respective attributes i.e. params[:article]
    # title & text from :article are automatically mapped to their correct columns in the db
    # @article = Article.new(params[:article]) - won't work due to Strong Parameters
    @article = Article.new(article_params)
    # save model in db. Boolean is returned
    @article.save
    # show the action???
    redirect_to @article

    private
      def article_params
        params.require(:article).permit(:title, :text)
      end      
    
  end
end
