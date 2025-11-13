class User < ApplicationRecord
  has_secure_password
  
  # AGREGAR ESTAS RELACIONES:
  has_many :tasks, dependent: :destroy
  has_many :categories, dependent: :destroy
  
  validates :email, 
    presence: true, 
    uniqueness: true,
    format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :name, presence: true
  validates :password, length: { minimum: 6 }, on: :create
end
