class Favorite < ApplicationRecord
  belongs_to :cook
  belongs_to :post 
  belongs_to :user #ユーザ/お気に入り
  
end
