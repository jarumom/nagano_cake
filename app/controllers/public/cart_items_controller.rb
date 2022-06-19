class Public::CartItemsController < ApplicationController
  def index
    @cart_items = current_customer.cart_items
  end

  def create
    @cart_item = current_customer.cart_items.build(cart_item_params)
    @cart_item.save
    redirect_to cart_items_path
  end

  def update
  end

  def destroy
    @cart_items = current_customer.cart_items
    cart_item = CartItem.find(params[:id])
    cart_item.destroy
    render :index
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:amount, :item_id, :customer_id)
  end

end
