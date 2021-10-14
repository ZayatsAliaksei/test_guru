Rails.application.routes.draw do

  namespace :admin do
    get 'gist/index'
  end
  root to: "tests#index"

  devise_for :users, path: :gurus, path_names: {sign_in: :login, sign_out: :logout}

  resources :tests, only: :index do
    member do
      post :start
    end
  end

  resources :test_passages, only: %i[show update] do
    member do
      get :result
      post :gist
    end
  end

  namespace :admin do
    resources :gist, shallow: true, only: %i[index]
    resources :tests do
      resources :questions, shallow: true, except: :index do
        resources :answers, shallow: true
      end
    end
  end

end
