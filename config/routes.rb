Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  
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

  resources :batches do
    collection do
      post 'choose_school'
    end
    member do
      get 'assign_cls_teacher'
      post 'assigned_cls_teacher'
    end 
  end

  resources :school_classes
  resources :class_sections
  resources :admissions
  resources :class_teachers
  resources :exams
  resources :question_papers
  resources :customer_registrations

end