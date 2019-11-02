class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
  has_one :orders, dependent: :nullify # 유저가 지워졌을때, 오더테이블의 포린키를 Null 로 설정되게 함. 
  # orders -> order 여야 하지만, 첨에 has_many 로 만들어서 orders로 네이밍 됨. 
  
end