Rails.application.routes.draw do
  
  # get 'bages_users/index'
  # get 'bages_rules/index'
  # get 'bages_rules/new'
  # get 'bages_rules/create'
  # get 'bages_rules/show'
  # get 'bages_rules/edit'
  # get 'conditions/index'
  # get 'conditions/new'
  # get 'conditions/create'
  # get 'conditions/show'
  # get 'conditions/edit'
  # get 'bages/index'
  # get 'bages/new'
  # get 'bages/create'
  # get 'bages/show'
  # get 'bages/edit'
  root to: 'tests#index'
  get '/admin/tests/:id/update_inline', to: 'admin/tests#index'

  devise_for :users, path: :gurus, path_names: { sign_in: :login, sign_out: :logout }

  resources :feed_backs, only: [:new, :create]

  resources :tests, only: :index do
    
    member do
      post :start
    end
  end
  resources :test_passages, only: [:show, :update] do
    member do
      get :result
      post :gist
    end
  end
  namespace :admin do
    resources :tests do
      patch :update_inline, on: :member
      resources :questions, shallow: true, except: :index do
        resources :answers, shallow: true, except: :index
      end
    end
    resources :bages
    resources :bages_rules
    resources :bages_users
    resources :conditions
  end
  resources :gists, only: :index
end
