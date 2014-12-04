Rails.application.routes.draw do
  devise_for :users, only: :sessions

  resources :posts
  resources :contact_forms

  root "posts#index"
  get '/about' => 'pages#about'
  get '/sitemap' => 'sitemaps#index'

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
