class OrdersController < InheritedResources::Base
  include CurrentCart
  
  before_action :set_cart, only: [:new, :create]
  
  def new
    if @cart.cart_items.empty?
      redirect_to root_url, notice: 'Your cart is empty'
      return
    end
    
    @order = Order.new
  end

  private
  
  def order_params
    params.require(:order).permit(:name, :address, :email, :pay_type)
  end
end

