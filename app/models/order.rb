class Order < ApplicationRecord
  belongs_to :client
  belongs_to :zone
  has_many :order_products
  has_many :products, through: :order_products
  has_one :payment
end
