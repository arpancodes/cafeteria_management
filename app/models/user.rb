class User < ApplicationRecord
  has_secure_password
  has_many :orders
  validates :first_name, presence: true
  validates :first_name, length: { minimum: 2 }
  validates :email, presence: true
end
