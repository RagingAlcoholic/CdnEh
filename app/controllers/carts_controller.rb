class CartsController < InheritedResources::Base
  
  rescue_from ActiveRecord::RecordNotFound, with: :invalid_cart

  private
  
    def cart_params
      params.require(:cart).permit()
    end
    
    def invalid_cart
      logger.error "Attempt to access invalid cart #{params[:id]}"
      
      redirect_to root_url, notice: 'Invalid cart'
    end
end

