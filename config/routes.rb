Rails.application.routes.draw do
  devise_for :users
  get 'home/index' # without this line - http get request -'home/index' won't work.
  resources :posts # without this line - all http request railted to 'posts' won't work.

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # root 'posts#index' # This will root address to re direct to posts 'index' actions.

  root :to => "home#index"
end
