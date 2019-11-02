class OrderConfirm < ApplicationRecord
    belongs_to :order, :optional => true
    validates_uniqueness_of :order_id, allow_nil: true
end
