Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # 顧客用
  # URL: /customers/...
  devise_for :customers, skip: [:passwords], controllers: {
    registrations: "public/devise/registrations",
    sessions: 'public/devise/sessions',
  }
  devise_scope :customer do
    post 'customers/guest_sign_in' => 'public/devise/sessions#guest_sign_in', as: "guest_session"
  end

  # 管理者用
  # URL: /admin/sign_in ...
  devise_for :admins, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/devise/sessions",
  }

  scope module: :public do
    root to: 'homes#top'
    get 'homes/about'
    get '/:username' => "customers#show", as: "customer_profile"
    get '/:username/favorites' => 'customers#favorites', as: "customer_favorites"
    patch '/:username/withdraw' => 'customers#withdraw', as: "customer_withdraw"
    get '/explore/tags/:name' => "posts#tag", as: "post_tag"
    get '/keywords/search' => "searches#search", as: "search"
    get '/:username/pending' => 'posts#pending', as: "post_pending"

    resources :posts, except: [:index] do
      resources :post_comments, only: [:create, :destroy]
      resource :favorites, only: [:create, :destroy]
    end
    resources :customers, only: [:update]

  end

  namespace :admin do
    resources :customers, only: [:index,:show,:update,:edit]
  end

end
