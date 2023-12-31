class UsersController < ApplicationController
  # 各アクションを実行する前に実行したい処理を指定(before_action)
    # メソッドは一番下に定義してる
  before_action :is_matching_login_user, only: [:edit, :update]
  
  def show
    @user = User.find(params[:id])
    
  # @user.post_imagesに格納されているデータは複数あるため,
  # 関連づけられているモデルのカラムを操作することはできません。
    @post_images = @user.post_images.page(params[:page])
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end

  
  private

  def user_params
    params.require(:user).permit(:name, :profile_image)
  end
  
  # 他のユーザーからのアクセス制限(is_matching_login_userというメソッドにまとめる)
  def is_matching_login_user
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to post_images_path
    end
  end
  
end
