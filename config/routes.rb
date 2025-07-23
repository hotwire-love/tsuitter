Rails.application.routes.draw do
  resources :tsueets

  root 'tsueets#index'
end
