class Cook < ApplicationRecord
    has_many :posts
    has_many :favorites
    
    has_many :user
end
