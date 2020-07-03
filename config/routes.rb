Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'newgames#home'
  get 'new', to: 'newgames#new'
  post 'score', to: 'newgames#score'
end
