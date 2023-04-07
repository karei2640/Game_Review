class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!

  def show
    @customer = current_customer
    @games = @customer.games
    @bordgames = @customer.bordgames
  end
  
  def index
  end

 
  def withdrawal
    @customer = current_customer
    @customer.update(withdraw: true)
    reset_session
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to root_path
  end

  def edit
    @customer = current_customer
  end

  def update
    @customer = current_customer
    if @customer.update(customer_params)
      flash[:notice] = "登録情報の編集が成功しました"
      redirect_to customer_path(@customer)
    else
      render :edit
    end
  end
    
  private

  def customer_params
    params.require(:customer).permit(:name, :profile_image, :birthday, :post_code, :prefecture_code, :address, :telephone, :email, :password, :password_confirmation)
  end



  
end


  
  


