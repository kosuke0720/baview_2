class OrderAddress

  include ActiveModel::Model
  attr_accessor :zip_code,:prefecture_id,:city,:address,:building_name,:phone_number,:token,:user_id,:item_id,:token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :zip_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :token
    validates :zip_code
    validates :city
    validates :address
    validates :phone_number,format: {with: /\A\d{10,11}\z/, message: "is invalid."}
  end
    validates :prefecture_id, numericality: {other_than: 0, message: "can't be blank"}

  def save
        order = Order.create(user_id: user_id, item_id: item_id)
        Address.create(zip_code: zip_code, prefecture_id: prefecture_id, city: city, address: address, building_name: building_name, phone_number: phone_number,order_id: order.id)
  end

end
