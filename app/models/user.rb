class User < ApplicationRecord
  has_secure_password
  validates :name, presence: true , length: { minimum: 3, maximum: 50 }
  validates :email, presence: true , length: { minimum: 3, maximum: 50 }
  validates :nickname, presence: true , length: { minimum: 3, maximum: 50 }
  # validates :password, presence: true , length: { minimum: 3, maximum: 50 }

end
