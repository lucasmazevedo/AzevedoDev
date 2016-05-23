class Admin::CategoriesController < ApplicationController

  before_action :set_category, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    @categories = Category.all
  end

  def show
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to admin_categories_path, notice: 'A categoria foi cadastrada com sucesso!'
    else
      render :new
    end

  end

  def edit

  end

  def update
    if @category.update(category_params)
      redirect_to admin_categories_path, notice: 'A categoria foi atualizada com sucesso!'
    else
      render :edit
    end
  end

  def destroy
    @category.destroy
    redirect_to admin_categories_path, notice: 'A categoria foi excluída com sucesso!'

  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name)
  end

end
