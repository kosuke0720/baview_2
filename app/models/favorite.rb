class Favorite < ApplicationRecord

  belongs_to :user  
  has_many :favorite_articles, through: :favorites, source: :article

end
