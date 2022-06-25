Rails.application.routes.draw do
  namespace :admin do
    get 'posts/index'
    get 'posts/show'
  end
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
    patch '/:username/withdraw' => 'customers#withdraw', as: "customer_withdraw"
    get '/explore/tags/:name' => "posts#tag", as: "post_tag"
    get '/keywords/search' => "searches#search", as: "search"
    get '/:username/draft' => 'posts#draft', as: "post_draft"

    resources :posts, except: [:index] do
      resources :post_comments, only: [:create, :destroy]
      resource :favorites, only: [:create, :destroy]
    end
    resources :customers, only: [:update]

  end

  namespace :admin do
    get '/customers/:id/posts' => 'customers#post_index', as: "customer_posts"
    get '/explore/tags/:name' => "posts#tag", as: "post_tag"
    get '/keywords/search' => "searches#search", as: "search"

    resources :customers, only: [:index, :show, :update, :edit]
    resources :posts, only: [:index, :show, :destroy]
  end

end
