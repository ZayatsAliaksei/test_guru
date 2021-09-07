Rails.application.routes.draw do

  root to: "tests#index"

  resources :tests do
    resources :questions, shallow: true
  end

  resources :questions do
    resources :answer,shallow: true
  end

end
