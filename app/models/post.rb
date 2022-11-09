class Post < ApplicationRecord
  acts_as_taggable 
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  attachment :post_image
  validates :user_id, presence: true
  validates :title, presence: true, length: { maximum: 50 }
  validates :body, presence: true, length: { maximum: 1000 }
  validates :menu, presence: true, length: { maximum: 50 }
  validates :address, presence: true, length: { maximum: 100 }
  validates :price, length: { maximum: 50 }
end
