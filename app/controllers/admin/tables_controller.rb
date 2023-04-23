class Admin::TablesController < ApplicationController
    
  def index
    @tables = Table.all
    @table = Table.new
  end
  
  def new
    @table = Table.new
  end
  
  def edit
   @table = Table.find(params[:id])
  end
  
  def update
    @table = Table.find(params[:id])
    if @table.update(table_params)
      redirect_to admin_tables_path, notice: "テーブルジャンルを変更しました。"
    else
      render 'edit'
    end
  end
  
  def create
    @table = Table.new(table_params)
    if @table.save
     redirect_to admin_tables_path, notice: "テーブルジャンルを追加しました。"
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
