class Public::RelationshipsController < ApplicationController
before_action :authenticate_customer!

 def create
  customer = Customer.find(params[:customer_id])
  current_customer.follow(customer.id)
  redirect_to request.referer
 end

 def destroy
  customer = Customer.find(params[:customer_id])
  current_customer.unfollow(customer)
  redirect_to request.referer
 end
 # フォロー一覧
  def followings
    @customer = Customer.find(params[:customer_id])
    @customers = @customer.followings.page(params[:page]).per(50)
  end
  # フォロワー一覧
  def followers
    @customer = Customer.find(params[:customer_id])
    @customers = @customer.followers.page(params[:page]).per(50)
  end
 
end
