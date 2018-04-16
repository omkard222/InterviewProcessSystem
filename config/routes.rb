Rails.application.routes.draw do
  root 'home#index'
  devise_for :users
  resources :employees
  resources :dutables
  resources :projects
  resources :feedbacks
  resources :schedulers do
    resources :feedbacks
  end

  resources :requirements do
    resources :candidates do
      resources :schedulers
    end
  end



  get 'users/index'
  get 'admin/index'
end
