Rails.application.routes.draw do
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
  end
  resources :gists, only: :index
  resources :bages, only: [:index] do
      get :bages_by_user, on: :collection
  end
end
