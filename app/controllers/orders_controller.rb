class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  # GET /orders
  # GET /orders.json
  def index
    if !current_user.admin? # 관리자가 아니면 경고와함께 리다이렉트해줌. 
      puts 'You are not an admin'
      flash[:alert] = "접근할 수 있는 권한이 없습니다."
      redirect_to profile_userdetail_path
    else 
      @orders = Order.all
    end
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
    if @order.user_id.to_s == current_user.id.to_s || current_user.admin? #접근할려는 게시물의 해당 유저이거나, 관리자인 경우에만 show 를 렌더.
      render "show"
    else
      flash[:alert] = "접근할 수 있는 권한이 없습니다."
      redirect_to profile_userdetail_path
    end
  end

  # GET /orders/new
  def new
    @order = Order.new
  end

  # GET /orders/1/edit
  def edit
    if @order.user_id.to_s == current_user.id.to_s || current_user.admin? #접근할려는 게시물의 해당 유저이거나, 관리자인 경우에만 show 를 렌더.
      render "edit"
    else
      flash[:alert] = "접근할 수 있는 권한이 없습니다."
      redirect_to profile_userdetail_path
    end
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(order_params)
    @order.user = current_user

    respond_to do |format|
      if @order.save
        format.html { redirect_to introduction_confirmed_path, notice: 'Order was successfully created.' }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to introduction_confirmed_path, notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to profile_userdetail_path, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      # params.fetch(:order, {})
      params.require(:order).permit(
        :name,
        :address,
        :school,
        :arrival,
        :duration_homestay,
        :exitexam,
        :medical_insurance,
        :vacation1_start,
        :vacation1_end,
        :vacation2_start,
        :vacation2_end,
        :refprice,
        :course
      )
    end
    
end