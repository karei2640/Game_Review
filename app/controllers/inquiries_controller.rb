class InquiriesController < ApplicationController
  before_action :authenticate_admin!, only: [:untreated, :processing, :completed, :index, :edit, :update, :destroy]
  
  def new
    @inquiry = Inquiry.new
  end
  
  def untreated
    @untreated_inquiries = Inquiry.where(status: "未対応").order(created_at: :desc).page(params[:page]).per(20)
  end
  
  def processing
    @processing_inquiries = Inquiry.where(status: "対応中").order(created_at: :desc).page(params[:page]).per(20)
  end
  
  def completed
    @completed_inquiries = Inquiry.where(status: "対応済み").order(created_at: :desc).page(params[:page]).per(20)
  end

  def show
    @inquiry = Inquiry.find(params[:id])
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
