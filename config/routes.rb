Rails.application.routes.draw do

  # users

  get 'users/new'

  # static_pages

  root "static_pages#home"
  get "/help", to: "static_pages#help"
  get "/signup", to: "users#new"
  get "/learning", to: "static_pages#learning"
  resources :users

  # assessments

  get 'assessments/study_activities'
  #resources :study_activities
  #get 'assessments/study_activities/:id' to 'study_activities#show'


  # for individual quiz implementation
  # get 'asessments/study_activities/:q_id', to: 'assessments#study_activities#_id',
  # constraints: lambda { |request| Quizzes.where(quiz_id: request[:q_id]).any? }, as: 'quiz'

end
