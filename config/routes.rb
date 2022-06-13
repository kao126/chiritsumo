Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # 顧客用
  # URL: /customers/...
  devise_for :customers, controllers: {
    registrations: "public/devise/registrations",
    sessions: 'public/devise/sessions',
    passwords: 'public/devise/passwords'
  }

  # 管理者用
  # URL: /admin/sign_in ...
  devise_for :admins, controllers: {
    registrations: "admin/devise/registrations",
    sessions: "admin/devise/sessions",
    passwords: 'admin/devise/passwords'
  }

  scope module: :public do
    root to: 'homes#top'
    get 'homes/about'
    get '/:username' => "customers#show", as: "customer_profile"
    get '/:username/favorites' => 'customers#favorites', as: "customer_favorites"
    patch '/:username/withdraw' => 'customers#withdraw', as: "customer_withdraw"
    get '/explore/tags/:hashname' => "posts#tag", as: "post_tag"

    resources :posts, except: [:index] do
      resource :favorites, only: [:create, :destroy]
    end
  end

end
