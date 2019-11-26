module PostsHelper

	def hide_email_detail(email)
		my_array = email.split("@")
		char_array = my_array[0].chars
		char_array.each_with_index { |variable, index| 
          if index > 2 
            char_array[index] = '#' 
          end 
        }
		char_array.join.concat('@').concat(my_array[1])
	end

end
