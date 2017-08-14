Rails.application.routes.draw do

  post 'create', to: 'shorties#create'

  get ':unique_key', to: 'shorties#show', as: :shorty
end
