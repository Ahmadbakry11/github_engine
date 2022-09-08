Rails.application.routes.draw do
  resources :repos_searches, only:[:create]
  resources :repos, only: [:index]
  root 'repos#index'
end
