class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  #  ⇩アソシエーション ,   ⇩ユーザーIDを消したら投稿も消える
  has_many :post_images, dependent: :destroy
end
