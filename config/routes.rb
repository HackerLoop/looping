Rails.application.routes.draw do
  devise_for :users
  root to: 'static_pages#home'

  post '/beta_signup',  to: 'beta_signup#create'
end
