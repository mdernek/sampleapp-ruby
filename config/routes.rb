Rails.application.routes.draw do
  get 'welcome/index'
  get '/articles/article_detail/:id', to: 'articles#article_detail', as: 'article_detail'
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resource :users, only: [:index, :show] do
    member do
      get 'login'
      post 'login_submit'
      get 'logout'
    end
  end

  resources :articles, only: [:article_detail] do
    resources :comments, only: [:new, :create]
  end
  
  scope '/admin' do
    resources :articles, except:[:article_detail] do
      resources :comments, only: [:index, :show, :destroy]
    end
  end

  root 'welcome#index', as: 'home'
end
