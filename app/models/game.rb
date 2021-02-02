class Game < ApplicationRecord
    has_many :collections
    has_many :reviews
    has_many :users, through: :collections
end
