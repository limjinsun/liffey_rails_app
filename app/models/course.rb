class Course < ApplicationRecord
    belongs_to :school
    has_many :orders

    def get_name
    	@school = School.find(self.school.id)
        "#{@school.name} / #{name}"
    end

end