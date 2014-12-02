class SaleItemsController < InheritedResources::Base
  private

    def sale_item_params
      params.require(:sale_item).permit(:item, :sale_price, :deadline)
    end
end
