class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  #has_one :order
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :shipping_cost
  belongs_to :prefecture
  belongs_to :shipping_date

  # ジャンルの選択が「---」の時は保存できないようにする
  validates :category_id, :status_id, :shipping_cost_id, :prefecture_id, :shipping_date_id,
            numericality: { other_than: 1, message: "can't be blank" }

  validates :image, presence: true
  validates :name, presence: true
  validates :price, presence: true,
                    numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  validates :explanation, presence: true
end
