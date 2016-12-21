class Order < ApplicationRecord
  belongs_to :client
  belongs_to :zone
  has_many :order_products
  has_many :products, through: :order_products
  has_many :order_employees
  has_many :employees, through: :order_employees
  has_one :payment
end
