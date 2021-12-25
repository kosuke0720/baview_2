class Order < ApplicationRecord
  attr_accessor :token
  belongs_to :user  
  belongs_to :items , optional: true
  has_one :address 

end
