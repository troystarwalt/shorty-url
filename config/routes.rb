Rails.application.routes.draw do

  get 'pages/index'

  root 'pages#index'

  post 'create', to: 'shorties#create'

  get ':unique_key', to: 'shorties#show', as: :shorty
end
