class ProfileController < ApplicationController
  before_action :check_user_logged_in
  before_action :get_users_order_and_orderconfirm, only: [:userdetail]

  def userdetail
  end

  private
    def get_users_order_and_orderconfirm
      @order = Order.where("user_id = ?", current_user.id.to_s).first
      if @order
        @order_confirm = OrderConfirm.where("order_id = ?", @order.id.to_s).first
      end
    end

    def check_user_logged_in 
      if !signed_in?
        puts "You need to be loged in."
        flash.keep[:alert] = "로그인이 필요한 메뉴입니다."
        redirect_to new_user_session_path
      end
    end

end
