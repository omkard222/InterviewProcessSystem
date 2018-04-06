Rails.application.routes.draw do
  root 'home#index'
  devise_for :users
  resources :employees
  resources :dutables

  resources :requirements do
    resources :candidates do
      resources :schedulers
    end
  end



  get 'users/index'
  get 'admin/index'
end
