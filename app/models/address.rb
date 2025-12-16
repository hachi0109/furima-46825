class Address < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture

  validates :town, :street, presence: true
  validates :post_code, presence: true, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
  validates :phone, presence: true, format: { with: /\A\d{10,11}\z/, message: 'is invalid. Input only number' }

  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" } 
end
