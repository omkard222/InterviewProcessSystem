Rails.application.routes.draw do
  root 'home#index'
  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :employees

  get '/dutables/project_list_by_manager' , controller: "dutables", action: "project_list_by_manager"
  resources :dutables
  resources :projects

  get 'feedbacks/get_feedback'
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



  get "dutable/get_project_requirement_details/:id" , controller: "dutables", action: "get_project_requirement_details", as: "dutable_get_project_requirement_details"
end
