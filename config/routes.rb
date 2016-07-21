Rails.application.routes.draw do
  root 'index#index'

  get '/auth/:provider/callback', to: 'session#create'
  delete '/logout', to: 'sessions#destroy'

  resources :topic do
    resources :thread do
      resources :post
    end
  end

  resources :user
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
