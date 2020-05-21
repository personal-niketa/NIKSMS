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

  resources :schools do
    member do
      get 'edit_profile'
      post 'update_profile'
    end
  end

end