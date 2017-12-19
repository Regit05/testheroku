Rails.application.routes.draw do

get '/admin', to: 'admin#index', as: 'admins'

get '/admin/:id', to: 'admin#show', as: 'admin'

get '/admin/:article_id/comments/:id/edit', to: 'comments#edit', as: "edit_admin_comment"

get '/informations/a-propos', to: 'informations#a_propos', as: 'informations_a_propos'
get '/informations/cgu', to: 'informations#cgu', as: 'informations_cgu'

  get 'rails/generate'

  get 'rails/controller'

  get 'rails/articles'

  get 'rails/admin'

  resources :contacts
  get 'welcome/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  resources :articles do
    resources :comments
  end

  root 'welcome#index'

end
