# frozen_string_literal: true

Rails.application.routes.draw do
  
  # post '/process/:id', to: "contact_uploads#process", as: "process_upload"
  resources :contacts, only: %i[index]
  resources :contact_uploads, only: %i[index new create edit update]
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_scope :user do
    authenticated :user do
      root 'contacts#index', as: :authenticated_root
    end
  
    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end
end
