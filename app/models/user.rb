class User < ApplicationRecord
    has_secure_password 
    validates :email, presence: true 
    validates :email, uniqueness: true
    validates :email, length: { minimum: 4 }

    has_many :collections
    has_many :reviews
    has_many :games, through: :reviews
    has_many :games, through: :collections
end
