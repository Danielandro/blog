class ArticlesController < ApplicationController
  def new

  end

  def create
    # pass render a simple hash:
    # key = plain, value = params[:article].inspect
    # params method returns an ActionController::Parameters object
    # Can use this object to access keys of hash using strings or symbols (e.g. :article)
    render plain: params[:article].inspect
  end
end
