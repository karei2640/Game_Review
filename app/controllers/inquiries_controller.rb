class InquiriesController < ApplicationController
  before_action :authenticate_admin!, only: [:index, :edit, :update, :destroy]
  def new
    @inquiry = Inquiry.new
  end

  def show
    @inquiry = Inquiry.find(params[:id])
  end

  def index
    @inquiries = Inquiry.all.page(params[:page]).per(10)
  end
  
  def edit
    @inquiry = Inquiry.find(params[:id])
  end

  def create
    @inquiry = Inquiry.new(inquiry_params)
    @inquiry.status = "未対応" 
    if @inquiry.save
      redirect_to inquiry_path(@inquiry), notice: 'お問い合わせを受け付けました。ありがとうございました。'
    else
      flash[:danger] = 'お問い合わせができませんでした。'
      render :new
    end
  end

  def update
    @inquiry = Inquiry.find(params[:id])
    if @inquiry.update(inquiry_params)
      redirect_to inquiry_path, notice: 'お問い合わせを更新しました。'
    else
      render :show
    end
  end
  
  private

  def inquiry_params
    params.require(:inquiry).permit(:name, :email, :message,:status)
  end
  
  def authenticate_admin!
    unless admin_signed_in?
      redirect_to root_path, alert: '管理者以外はアクセスできません'
    end
  end

end
