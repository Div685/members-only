class Post < ApplicationRecord
  belongs_to :user

  validates :title, presence: true, length: { minimum: 3, maximum: 60 }
  validates :post, length: { minimum: 3, maximum: 256 }
end
