class Admin::PlatformsController < ApplicationController
    
  def index
    @platforms = Platform.all
    @platform = Platform.new
  end
  
  def new
    @platform  = Platform.new
  end

  def create
    @platform = Platform.new(platform_params)
    if @platform.save
     redirect_to admin_platforms_path, notice: "ジャンルを追加しました。"
    else
     flash.now[:danger] = "予期せぬエラーが発生しました"
     @platforms = Platform.all
     render :index
    end
  end
  
  private

  def platform_params
   params.require(:platform).permit(:name)
  end
  
end
