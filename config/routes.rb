Rails.application.routes.draw do
  resources :feedbacks, :only => [:new, :create]  
  
  namespace :manage do
    resources :feedbacks
  end
end
