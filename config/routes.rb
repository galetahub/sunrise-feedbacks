Rails.application.routes.draw do
  resources :feedbacks, :only => [:new, :create]  
  
  namespace :manage do
    resources :feedbacks
    resources :feedback_answers, :only => [:create, :update, :destroy]
  end
end
