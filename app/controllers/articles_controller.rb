class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end 

  def show
    # route expects id parameter
    # all instance variables are passed to the view
    @article = Article.find(params[:id])
  end
  
  def new
    # otherwise invalid input wouldn't be passed to new template
    @article = Article.new
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
    if @article.save
    # redirect user to 'show' action
      redirect_to @article
    else
    # if save returns false, renders new.html.erb template.
    # using render instead of redirect_to so @article is passed to the new template
      render 'new'
    end
  end

  private
    def article_params
      params.require(:article).permit(:title, :text)
    end      
    
  
end
