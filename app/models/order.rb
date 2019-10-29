class Order < ApplicationRecord
  belongs_to :user, :optional => true
  validates_uniqueness_of :user_id, allow_nil: true # making sure order will be only 1 for user. 
end
