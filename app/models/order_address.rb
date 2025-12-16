class OrderAddress
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :town, :street, :building, :phone, :user_id, :item_id

  with_options presence: true do
    validates :user_id, :item_id, :town, :street
    validates :post_code, presence: true, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :phone, presence: true, format: { with: /\A\d{10,11}\z/, message: 'is invalid. Input only number' }
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" } 
  end

  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    Address.create(post_code: post_code, prefecture_id: prefecture_id, town: town, street: street, building: building, phone: phone, order_id: order.id)
  end
end