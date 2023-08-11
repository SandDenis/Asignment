Rails.application.routes.draw do

  devise_for :users, :controllers => { registrations: 'users/registrations' }

  get 'pet', to: 'pet#index'
  get 'pet/:id', to: 'pet#show'
  post 'pet', to: 'pet#create'

  get 'adoption-list', to: 'pet#adopt_list'
  get 'my-pet-list', to: 'pet#my_pets'
  post 'pet/:id/adopt', to: 'pet#adopt'
  post 'pet/:id/feed', to: 'pet#feed'
  post 'pet/:id/play', to: 'pet#play'


  post 'food', to: 'food#create'

  post 'toy', to: 'toy#create'

end
