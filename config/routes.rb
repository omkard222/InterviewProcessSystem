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
  get 'candidates/allcandidate'
  get "requirements/candidates/get_candidate_list", controller: "requirements", action: "get_candidate_list"
  get "dutables/projects/get_project_list", controller: "dutables", action: "get_project_list"
end
