class OrderItem < ApplicationRecord
  belongs_to :orders
  belongs_to :menu_items
end
