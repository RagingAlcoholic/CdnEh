class CartItemsController < InheritedResources::Base

  include CurrentCart
  
  before_action :set_cart, only: [:create]
  
  before_action :set_cart_item, only: [:show, :edit, :update, :destroy]
  
  def create
    product = Product.find(params[:product_id])
    
    @cart_item = @cart.cart_items.build(product: product)
    
    respond_to do |format|
      if @cart_item.save
        format.html { redirect_to @cart_item.cart, notice: 'Cart item was sucessfully created.'}
        format.json { render action: 'show', status: :created, location: @cart_item }
      else
        format.html { render action: 'new'}
        format.json { render json: @cart_item_errors, status: :unprecessable_entity }
      end      
    end
  end

  private

    def cart_item_params
      params.require(:cart_item).permit(:product, :cart_id)
    end
end

