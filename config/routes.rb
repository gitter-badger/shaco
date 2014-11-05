Blog::Application.routes.draw do
  devise_for :users, :path => '', :path_names => {:sign_in => 'login', :sign_out => 'logout'}
  resources :users
  resources :articles do
    resources :comments
  end
  root 'articles#index'
end
