class User < ApplicationRecord
    has_secure_password 
    validates :username, presence: true 
    validates :username, uniqueness: true
    validates :username, length: { minimum: 4 }

    has_many :collections
    has_many :reviews
    has_many :games, through: :reviews
    has_many :games, through: :collections
end
