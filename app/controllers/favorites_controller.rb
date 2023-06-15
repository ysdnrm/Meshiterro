class FavoritesController < ApplicationController
  
  def create
    post_image = PostImage.find(params[:post_image_id])
                                     #  （     A       :     B        ) = ( Bという値を A という名前で受け取る)
    favorite = current_user.favorites.new(post_image_id: post_image.id)
    favorite.save
    redirect_to post_image_path(post_image)
  end

  def destroy
    post_image = PostImage.find(params[:post_image_id])
    # find_by は、特定の条件にマッチした最初のレコードを検索(取得できるデータは1件のみ)
    #.            モデル名にfind_byメソッドをつなげて引数を1つ以上指定
    favorite = current_user.favorites.find_by(post_image_id: post_image.id)
    favorite.destroy
    redirect_to post_image_path(post_image)
  end
end
