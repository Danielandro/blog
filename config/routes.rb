Rails.application.routes.draw do
  get 'welcome/index' # map localhost:3000/welcome/index requests to welcome controller's index action

  #use resources method to declare standard REST resource
  resources :articles

  root 'welcome#index' # map '/' requests to welcome controller's index action
end
