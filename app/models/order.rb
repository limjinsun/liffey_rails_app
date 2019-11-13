class Order < ApplicationRecord
  belongs_to :user, :optional => true
  validates_uniqueness_of :user_id, allow_nil: true, message: '당 한개의 신청만 가능합니다' # making sure order will be only 1 for user. 
  has_one :order_confirm, dependent: :delete # 오더가 지워졌을때, 오더컨펌테이블의 데이타도 함께 지워짐. 
  after_create :create_order_confirm

  private
    def create_order_confirm
        my_order_confirm = OrderConfirm.new(:order_id => self.id.to_s)
        my_order_confirm.save
    end
end
