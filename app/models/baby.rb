class Baby < ApplicationRecord
  belongs_to :user
  has_many :articles, dependent: :destroy
  has_one_attached :image

  validates :image, presence: true
  validates :baby_name, presence: true
  validates :birth_date, presence: true
end
