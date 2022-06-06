class Cook < ApplicationRecord
    has_many :posts
    has_many :users
    has_many :favorites
end
