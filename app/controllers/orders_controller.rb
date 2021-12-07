class OrdersController < ApplicationController
  before_action :authenticate!

  def create
    @course = Course.find(params[:course_id])
    @order = @course.prepare_order(order_params)

    if @order.save
      # 刷卡！
      result = Braintree::Transaction.new.call(
        amount: @order.amount,
        nonce: params[:nonce]
      )

      if result.success?
        @order.pay! if @order.may_pay?
        redirect_to root_path, notice: '課程購買成功'
      else
        redirect_to root_path, notice: '付款過程發生問題'
      end
    else
      # render ...
    end
  end

  private
  def order_params
    params.require(:order)
          .permit(:recipient, :address)
          .merge(user: current_user)
  end
end
