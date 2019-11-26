Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :admins, :skip => [:registrations]
  resources :courses
  resources :schools
  resources :orders
  get 'profile/userdetail'
  get 'introduction/join'
  get 'introduction/consulting'
  get 'introduction/confirmed'
  get 'introduction/test'
  get 'introduction/school'
  get 'introduction/mypage'
  devise_for :users, :controllers => {
  	:sessions => 'customdevise/sessions',
  	:passwords => 'customdevise/passwords',
  	:registrations => 'customdevise/registrations'
    }  # generate all route for devise - with user object. It will use my custom controllers.

  get 'home/index' # without this line - http get request -'home/index' won't work.
  
  resources :admins, :only => [:index]  # 어드민을 위한 인데스 처음페이지
  resources :posts # generate all route for posts.
  resources :comments # 코멘트를 위한 모든 루트설정 

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # root 'posts#index' # This will root address to re direct to posts 'index' actions.

  root :to => "home#index"
end
