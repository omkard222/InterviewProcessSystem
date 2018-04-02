Rails.application.routes.draw do
  root 'home#index'
  devise_for :users

  resources :requirements do
    resources :candidates
  end

  get 'users/index'
  get 'admin/index'
end
