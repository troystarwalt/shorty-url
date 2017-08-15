Rails.application.routes.draw do

  root 'pages#index'

  get '/shorties/all', to: 'shorties#index'

  post 'create', to: 'shorties#create'

  get ':unique_key', to: 'shorties#show', as: :shorty
end
