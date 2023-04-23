class Admin::CategoriesController < ApplicationController
    
  def index
    @categories = Category.all
    @category = Category.new
  end
  
  def new
    @category = Category.new
  end
  
  def edit
   @category = Category.find(params[:id])
  end
  
  def update
    @category = Category.find(params[:id])
    if @category.update(category_params)
      redirect_to admin_categories_path, notice: "プレイ人数を変更しました。"
    else
      render 'edit'
    end
  end


  def create
   @category = Category.new(category_params)
   if @category.save
     redirect_to admin_categories_path, notice: "プレイ人数を追加しました。"
   else
    flash.now[:danger] = "予期せぬエラーが発生しました"
    @categories = Category.all 
    render :index
   end
  end

  private

  def category_params
   params.require(:category).permit(:name)
  end
  
  
end
