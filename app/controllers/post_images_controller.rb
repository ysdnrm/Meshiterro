class PostImagesController < ApplicationController
  def new
    @post_image = PostImage.new
  end
  
  def create
    @post_image = PostImage.new(post_image_params)
    # current_user は、ログイン中のユーザーの情報を取得できる便利な記述(devise を導入しないと使用することができない)
    @post_image.user_id = current_user.id
   if @post_image.save
      redirect_to post_images_path
   else
      render :new
   end  
  end

  def index
    # 1ページ分の決められた数のデータだけを、新しい順に取得するように変更
    @post_images = PostImage.page(params[:page])
  end
  
  def show
    @post_image = PostImage.find(params[:id])
    @post_comment = PostComment.new
  end
  
  def destroy
    post_image = PostImage.find(params[:id])
    post_image.destroy
    redirect_to post_images_path
  end
  
  
  # 投稿データのストロングパラメータ
  private

  def post_image_params
    params.require(:post_image).permit(:shop_name, :image, :caption)
  end
  
end
