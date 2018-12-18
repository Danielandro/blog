class ArticlesController < ApplicationController

  http_basic_authenticate_with name: "lpp", password: "secret", except: [:index, :show]
  
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

    # update articles
  def edit
    # automatically creates a url for submitting the edited article form
    # uses PATCH http protocol
    @article = Article.find(params[:id])
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

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to articles_path
  end

  private
    def article_params
      params.require(:article).permit(:title, :text)
    end      
    
  
end
