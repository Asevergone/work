Rails.application.routes.draw do

  post 'articles/findtitle'

  post 'articles/finduser'

  get 'articles/findbyuser'

  get 'articles/findbytitle'

  get 'articles/find'

  get 'comments/show'

  get 'comments/new'

  get 'users/details'

  get 'articles/show'

  get 'articles/new'

  get 'users/quit'

  get 'login/myinfo'

  get 'users/myinfo'

  get 'login/create'

  get 'users/update'

  get 'users/view'

  get 'users/edit'

  get 'login/show'

  get 'login/log'

  get 'login/index'

  get 'users/show'

  get 'users/register'

  get 'users/login'

  get 'users/index'
  post 'users/create'
  post 'login/create'
  post 'articles/create'
  post 'comments/create'
  resources :login 
  resources :users
  resources :articles
  resources :comments
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
