class Article < ApplicationRecord
  belongs_to :baby, optional: true
  has_many :favorites,through: :favorites,dependent: :destroy
  has_one_attached :image

  validates :image, presence: true
  validates :content, presence: true
  validates :content_date, presence: true
end
