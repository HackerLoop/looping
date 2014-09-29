Rails.application.routes.draw do
  devise_for :users
  root to: 'static_pages#home'

  post '/beta_signup',  to: 'beta_signup#create'
  get  '/thanks',       to: 'beta_signup#thanks', as: 'beta_signup_thanks'
end
