class Admin::CustomersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @customers = Customer.page(params[:page])
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      flash[:notice] = "会員情報を変更しました。"
      redirect_to admin_customer_path
    else
      render "edit"
    end
  end

  private

  def set_customer
    @customer = Customer.find(params[:id])
  end
  
  def customer_params
   params.require(:customer).permit(:name, :birthday, :post_code, :prefecture_code, :address, :telephone,:withdrawal, :email)
  end

  
end


  
  


