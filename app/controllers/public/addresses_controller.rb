class Public::AddressesController < ApplicationController
  def new
    @address = Address.new
  end

  def create
    @address = Address.new(address_params)
    @address.customer_id = current_customer.id
    @address.save
    redirect_to addresses_path
    @addresses = current_customer.addresses
  end

  def index
    @address = Address.new
    @addresses = current_customer.addresses
  end

  def edit
    @address = Address.find(params[:id])
  end

  def update
    @address = Address.find(params[:id])
    if @address.update(address_params)
      redirect_to addresses_path
    else
      render :edit
    end
  end

  def destroy
    @addresses = current_customer.addresses
    address = Address.find(params[:id])
    address.destroy
    render :index
  end

  private

  def address_params
    params.require(:address).permit(:name, :postal_code, :address, :customer_id)
  end

end
