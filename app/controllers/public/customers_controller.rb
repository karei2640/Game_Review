class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!
  skip_before_action :authenticate_customer!, if: -> { admin_signed_in? }

  def show
    @customer = Customer.find(params[:id])
    @games = @customer.games.page(params[:games_page]).per(50)
    @bordgames = @customer.bordgames.page(params[:boardgames_page]).per(50)
    @following_games = Game.joins(customer: :followers).where(followers: { follower_id: current_customer.id })
  end
  
  def index
  end
  
  def unsubscribe
    @customer = current_customer
  end

 
  def withdrawl
    @customer = current_customer
    @customer.update(withdrawal: true)
    reset_session
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to root_path
  end
  
  def edit
    @customer = Customer.find(params[:id])
    if @customer == current_customer
      render :edit
    else
      redirect_to root_path, alert: "他のユーザーの情報は編集できません"
    end
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


  
  


