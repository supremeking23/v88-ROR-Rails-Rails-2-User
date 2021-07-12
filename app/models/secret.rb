class Secret < ApplicationRecord
  belongs_to :user
  has_many :likes
  #has users through likes table
  has_many :users, through: :likes, source: :user

end
