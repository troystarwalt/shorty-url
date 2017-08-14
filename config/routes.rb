Rails.application.routes.draw do

  post 'create', to: 'shorties#create'

  get 'shorties/show'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
