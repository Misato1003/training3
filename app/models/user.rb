class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :cooks
  has_many :posts
  has_many :favorites
  
  def favorite_find(cook_id)
    favorites.where(cook_id: cook_id).exists?
  end
end
