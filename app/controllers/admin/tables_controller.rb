class Admin::TablesController < ApplicationController
    
  def index
    @tables = Table.all
    @table = Table.new
  end
  
  def new
    @table = Table.new
  end
  
  def create
    @table = Table.new(table_params)
    if @table.save
     redirect_to admin_tables_path, notice: "ジャンルを追加しました。"
    else
     flash.now[:danger] = "予期せぬエラーが発生しました"
     @tables = Table.all
     render :index
    end
  end
  
  private

  def table_params
   params.require(:table).permit(:name)
  end
  
end
