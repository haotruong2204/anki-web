Rails.application.routes.draw do
  require 'sidekiq/web'

  # mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  mount Sidekiq::Web => "/sidekiq"

  root "account/dashboard#index"

  namespace :account do
    root "dashboard#index"
   
    devise_for :accounts, path: "", path_names: { sign_in: "login", sign_out: "logout" }
  end
end
