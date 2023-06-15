class Favorite < ApplicationRecord
   # アソシエーション( Favorite : User = N : 1 )(Userは単数系)
  belongs_to :user
   # アソシエーション( Favorite : PostImage = N : 1 )(PostImageは単数系)
  belongs_to :post_image
end
