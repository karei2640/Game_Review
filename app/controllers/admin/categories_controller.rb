class Admin::CategoriesController < ApplicationController
    
  def index
    @categories = Category.all
    @category = Category.new
  end
  
  def new
    @category = Category.new
  end


  def create
   @category = Category.new(category_params)
   if @category.save
     redirect_to admin_categories_path, notice: "カテゴリを追加しました。"
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
