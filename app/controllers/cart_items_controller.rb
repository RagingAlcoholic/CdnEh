class CartItemsController < InheritedResources::Base
  include CurrentCart

  before_action :set_cart, only: [:create]

  before_action :set_cart_item, only: [:show, :edit, :update, :destroy]

  def create
    product = Product.find(params[:product_id])

    @cart_item = @cart.add_product(product.id)

    respond_to do |format|
      if @cart_item.save
        format.html { redirect_to root_url }
        format.js
        format.json { render action: 'show', status: :created, location: @cart_item }
      else
        format.html { render action: 'new' }
        format.json do
          render json: @cart_item_errors, status:
                      :unprecessable_entity
        end
      end
    end
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:product_id)
  end
end
