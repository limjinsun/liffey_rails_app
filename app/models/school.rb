class School < ApplicationRecord
    has_many :courses, dependent: :destroy # 스쿨이 지워지면 코스도 함께 데이타 베이스에서 사라짐. . 

    def name_with_location
        "#{name}. #{location}"
    end
end
