class User < ApplicationRecord
  has_many :user_decks
  has_many :decks, through: :user_decks


  validates :username, presence: true
  validates :username, length:{maximum:10}

  has_secure_password





end
