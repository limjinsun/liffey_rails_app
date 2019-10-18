Rails.application.routes.draw do
  get 'introduction/join'
  get 'introduction/consulting'
  devise_for :users, :controllers => { 
  	:sessions => 'customdevise/sessions',
  	:passwords => 'customdevise/passwords',
  	:registrations => 'customdevise/registrations' }  # generate all route for devise - with user object.
  
  get 'home/index' # without this line - http get request -'home/index' won't work.
  resources :posts # generate all route for posts.

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # root 'posts#index' # This will root address to re direct to posts 'index' actions.

  root :to => "home#index"
end