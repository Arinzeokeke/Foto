Rails.application.routes.draw do
  get 'relationships/follow_user'

  get 'relationships/unfollow_user'

  get 'notifications/link_through'

  get 'profiles/show'

  get 'test/index'

  get 'test/edit'

  get 'comments/index'

  get 'comments/edit'

  get 'notifications', to: 'notifications#index'
  resources :posts do
    resources :comments
    member do
      get 'like'
    end
  end
  post ':user_name/follow_user', to: 'relationships#follow_user', as: :follow_user
  post ':user_name/unfollow_user', to: 'relationships#unfollow_user', as: :unfollow_user

  get 'browse', to: 'posts#browse', as: :browse_posts

  #for something like john.com/arinze
  get ':user_name', to: 'profiles#show', as: :profile

  get ':user_name/edit', to: 'profiles#edit', as: :edit_profile

  patch ':user_name/edit', to: 'profiles#update', as: :update_profile

  #get ":id/like", to: "posts#like", as: :like_post

  get 'notifications/:id/link_through', to: 'notifications#link_through', as: :link_through

  get 'notifications', to: 'notifications#index'

  devise_for :users, :controllers => { registrations: 'registrations' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root "posts#index"
end
