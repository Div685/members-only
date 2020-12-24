class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :posts

  validates :username, :email, presence: true, uniqueness: true
  validates :username, length: { minimum: 3, maximum: 16 }
  validates :name, length: { minimum: 3, maximum: 40 }
end
