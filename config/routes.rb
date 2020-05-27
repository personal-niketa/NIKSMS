Rails.application.routes.draw do
  devise_for :users

  devise_scope :user do
    authenticated do
      root 'schools#dashboard', as: :authenticated_root
    end
    
    root to: "devise/sessions#new"
  end
  
  resources :users, except: :create do
    collection do
      post 'registration'
      post 'create_user'
    end
    member do
      get 'edit_password'
      patch 'update_password'
    end
  end

  resources :schools do
    member do
      get 'edit_profile'
      post 'update_profile'
    end
  end

  resources :school_classes
  resources :class_sections

end