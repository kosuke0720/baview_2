class Order < ApplicationRecord
  attr_accessor :token
  belongs_to :user  
  has_one :items  
  has_one :address 

  validates :token, presence: true

end
