class Cook < ApplicationRecord
    has_many :favorites
    has_many :users
    has_many :posts
end
