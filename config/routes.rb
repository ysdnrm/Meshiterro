Rails.application.routes.draw do

  # Topページに[root_path]を設定
  root to: "homes#top"

  # devise のモデルを作成したことでルーティングが自動的に追加
  # devise を使用する際に URL として users を含むことを示している
  devise_for :users

   get '/homes/about' => 'homes#about', as: 'about'

  resources :post_images, only: [:new, :create, :index, :show, :destroy] do
    # post_imagesと親子関係（「親」に対して「子」される）
      # ⇩ resourceとなっている点に注目!(単数形にすると、/:idがURLに含まれなくなる。)
    resource :favorites, only: [:create, :destroy]
    resources :post_comments, only: [:create, :destroy]
    # ↑ ネストする(params[:post_image_id]でPostImageのidが取得できるようになります。)
  end

  resources :users, only: [:show, :edit, :update]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
