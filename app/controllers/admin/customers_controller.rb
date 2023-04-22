class Admin::CustomersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @customers = Customer.all
    if params[:name].present?
      @customers = @customers.where('name LIKE ?', "%#{params[:name]}%")
    end
    if params[:email].present?
      @customers = @customers.where('email LIKE ?', "%#{params[:email]}%")
    end
    @customers = @customers.order(created_at: :desc).page(params[:page]).per(10)
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


  
  


