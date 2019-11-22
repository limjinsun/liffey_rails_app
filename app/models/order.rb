class Order < ApplicationRecord
  after_create :create_order_confirm
  belongs_to :course, :optional => true # 옵셔널 트루로 해주면 course_id 안넣더라도 디비에 입력할수 있음 
  belongs_to :user, :optional => true
  validates_uniqueness_of :user_id, allow_nil: true, message: '당 한개의 신청만 가능합니다' # making sure order will be only 1 for user. 
  has_one :order_confirm, dependent: :delete # 오더가 지워졌을때, 오더컨펌테이블의 데이타도 함께 지워짐. 
  
  private
    def create_order_confirm
        my_order_confirm = OrderConfirm.new(:order_id => self.id.to_s)
        my_order_confirm.status = "인보이스 발급 준비중"
        my_order_confirm.save
    end
end
