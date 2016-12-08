Rails.application.routes.draw do
  get 'profiles/show'

  get 'test/index'

  get 'test/edit'

  get 'comments/index'

  get 'comments/edit'
  resources :posts do
    resources :comments
    member do
      get 'like'
    end
  end

  #for something like john.com/arinze
  get ':user_name', to: 'profiles#show', as: :profile

  get ':user_name/edit', to: 'profiles#edit', as: :edit_profile

  patch ':user_name/edit', to: 'profiles#update', as: :update_profile

  #get ":id/like", to: "posts#like", as: :like_post

  devise_for :users, :controllers => { registrations: 'registrations' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root "posts#index"
end
