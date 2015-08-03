Rails.application.routes.draw do
  root to: 'creatures#index'
  ## Also just to keep it RESTful
  resources :creatures
end
