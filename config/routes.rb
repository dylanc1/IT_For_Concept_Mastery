Rails.application.routes.draw do
  resources :skills

  # users

  get 'users/new'

  # static_pages

  root "static_pages#home"
  get "/help", to: "static_pages#help"
  get "/signup", to: "users#new"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  resources :users

  # learning

  get 'learning/dashboard'
  get 'learning/skills'

  get "/learning", to: "learning#dashboard"

  # assessments

  get 'assessments/study_activities'
  # resources :study_activities
  # get 'assessments/study_activities/:id' to 'study_activities#show'


  # for individual quiz implementation
  # get 'asessments/study_activities/:q_id', to: 'assessments#study_activities#_id',
  # constraints: lambda { |request| Quizzes.where(quiz_id: request[:q_id]).any? }, as: 'quiz'

end
