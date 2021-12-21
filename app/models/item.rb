class Item < ApplicationRecord
  belongs_to :user
  has_one :order 

  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions 
  belongs_to :category
  belongs_to :items_status
  belongs_to :send_fee


    validates :item_name, presence: true
    validates :price, numericality: {only_integer: true, less_than_or_equal_to: 50000,format: { with: /\A[0-9]+\z/ }},  presence: true
    validates :introduce, presence: true
    validates :image, presence: true

    validates :category_id, numericality: { other_than: 1 , message: "can't be blank"} 
    validates :items_status_id, numericality: { other_than: 1 , message: "can't be blank"} 
    validates :send_fee_id, numericality: { other_than: 1 , message: "can't be blank"} 

end
