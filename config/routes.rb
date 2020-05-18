Rails.application.routes.draw do
  devise_for :users

  devise_scope :user do
    authenticated do
      root 'schools#dashboard', as: :authenticated_root
    end
    
    root to: "devise/sessions#new"
  end
  
  resources :users do
    collection do
      post 'registration'
    end
  end

  get 'schools/dashboard'
end