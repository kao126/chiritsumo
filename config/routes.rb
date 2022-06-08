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
    get '/customers/:id/my_page' => "customers#show", as: "customer_mypage"
    get '/customers/unsubscribe' => 'customers#unsubscribe'
    patch '/customers/withdraw' => 'customers#withdraw'

    resources :posts, except: [:new]
    resources :customers, only: [:create, :edit, :update]


  end
end
