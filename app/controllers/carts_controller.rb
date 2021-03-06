class CartsController < InheritedResources::Base
  before_action :set_cart, only: [:show, :edit, :update, :destroy]
  rescue_from ActiveRecord::RecordNotFound, with: :invalid_cart

  def destroy
    @cart.destroy if @cart.id == session[:cart_id]

    session[:cart_id] = nil

    respond_to do |format|
      format.html { redirect_to cart_url }
      format.js
      format.json { head :no_content }
    end
  end

  private

  def set_cart
    @cart = Cart.find(params[:id])
  end

  def cart_params
    params.require(:cart).permit
  end

  def invalid_cart
    logger.error "Attempt to access invalid cart #{params[:id]}"

    redirect_to root_url, notice: 'Invalid cart'
  end
end
