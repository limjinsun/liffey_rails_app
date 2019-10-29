class ProfileController < ApplicationController
  before_action :check_user_logged_in
  before_action :get_users_order, only: [:userdetail]

  def userdetail
    # puts 'id : ' + current_user.id.to_s
    # puts @orders.size
  end

  private
    def get_users_order
      @order = Order.where("user_id = ?", current_user.id.to_s).first
      # @order = Order.where("user_id = ?", current_user.id.to_s)
    end

    def check_user_logged_in 
      if !signed_in?
        puts "You need to be loged in."
        flash.keep[:alert] = "로그인이 필요한 메뉴입니다."
        redirect_to new_user_session_path
      end
    end

end
