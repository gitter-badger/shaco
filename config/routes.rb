Blog::Application.routes.draw do
  resources :articles
  root 'welcome#index'
end
