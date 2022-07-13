class Post < ApplicationRecord
  acts_as_taggable 
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  attachment :image
  validates :user_id, presence: true
  validates :title, presence: true
  validates :body, presence: true
  validates :menu, presence: true
  validates :address, presence: true
end
