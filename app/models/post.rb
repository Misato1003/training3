class Post < ApplicationRecord
  belongs_to :cook
  
  #投稿/お気に入り
  belongs_to :cook, optional: true
  has_many :favorites
  belongs_to :user
  validates :content, presence: true
end
