class Admin::TableplatsController < ApplicationController
  def index
    @tableplats = Tableplat.all
    @tableplat = Tableplat.new
  end
  
  def new
    @tablplat = Tableplat.new
  end
  
  def create
    @tableplat = Tableplat.new(tableplat_params)
    if @tableplat.save
     redirect_to admin_tableplats_path, notice: "ジャンルを追加しました。"
    else
     flash.now[:danger] = "予期せぬエラーが発生しました"
     @tables = Tableplat.all
     render :index
    end
  end
  
  private

  def tableplat_params
   params.require(:tableplat).permit(:name)
  end
  
  
  
end
