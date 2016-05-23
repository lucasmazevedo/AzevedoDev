class Admin::WorksController < ApplicationController

  before_action :set_work, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    @works = Work.all
  end

  def show
  end

  def new
    @work = Work.new
  end

  def create
    @work = Work.new(work_params)

    if @work.save
      redirect_to admin_works_path, notice: 'A categoria foi cadastrada com sucesso!'
    else
      render :new
    end

  end

  def edit

  end

  def update
    if @work.update(work_params)
      redirect_to admin_works_path, notice: 'O trabalho foi atualizado com sucesso!'
    else
      render :edit
    end
  end

  def destroy
    @work.destroy
    redirect_to admin_works_path, notice: 'O trabalho foi excluído com sucesso!'

  end

  private

  def set_work
    @work = Work.find(params[:id])
  end

  def work_params
    params.require(:work).permit(:name, :description, :link, :image, :tags, :category_id)
  end

end
