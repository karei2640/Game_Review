class NoticesController < ApplicationController
  before_action :authenticate_admin!, only: [:new, :create, :edit, :update, :destroy]
  def index
    @category = params[:category] || 'all'
    @notices = filter_notices(@category).page(params[:page]).per(15)
    @maintenance_notices = Notice.where(category: 'メンテナンス').page(params[:page]).per(15)
    @announcement_notices = Notice.where(category:'お知らせ').page(params[:page]).per(15)
    @event_notices = Notice.where(category:'イベント').page(params[:page]).per(15)
  end

  def new
    @notice = Notice.new
    @categories = ["メンテナンス", "お知らせ", "イベント"]
  end

  def show
    @notice = Notice.find(params[:id])
  end

  def create
    @notice = Notice.new(notice_params)
    @categories = ["メンテナンス", "お知らせ", "イベント"]
    if @notice.save
      redirect_to @notice, notice: "お知らせを作成しました。"
    else
      render :new
    end
  end

  def edit
    @notice = Notice.find(params[:id])
  end

  def update
    @notice = Notice.find(params[:id])
    if @notice.update(notice_params)
      redirect_to notices_path, notice: 'お知らせを更新しました。'
    else
      render :edit
    end
  end

  def destroy
    @notice = Notice.find(params[:id])
    @notice.destroy
    redirect_to notices_path, notice: 'お知らせを削除しました。'
  end

  private
  
  def filter_notices(category)
    case category
    when 'maintenance'
      Notice.where(category: 'メンテナンス')
    when 'announcement'
      Notice.where(category: 'お知らせ')
    when 'event'
      Notice.where(category: 'イベント')
    else
      Notice.all
    end
  end

  def notice_params
    params.require(:notice).permit(:title, :content, :category)
  end
  
  def authenticate_admin!
    unless admin_signed_in?
      redirect_to root_path, alert: '管理者以外はアクセスできません'
    end
  end
  
end