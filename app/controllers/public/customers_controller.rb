class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!

  def show
    @customer = current_customer
  end
  
  def index
  end

 
  def withdraw
  end

  def edit
    @customer = current_customer
  end

  def update
    @customer = current_customer
    @customer.update
  end
  
  


end