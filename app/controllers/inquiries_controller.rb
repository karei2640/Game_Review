class InquiriesController < ApplicationController
  
  def new
    @inquiry = Inquiry.new
  end

  def show
    @inquiry = Inquiry.find(params[:id])
  end

  def index
    @inquiries = Inquiry.all.page(params[:page]).per(1)
  end
  
  def edit
    @inquiry = Inquiry.find(params[:id])
  end

  def create
    @inquiry = Inquiry.new(inquiry_params)
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

end
