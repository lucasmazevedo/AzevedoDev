class Admin::ClientsController < ApplicationController

  before_action :set_client, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    @clients = Client.all
  end

  def show
  end

  def new
    @client = Client.new
  end

  def create
    @client = Client.new(client_params)

    if @client.save
      redirect_to admin_clients_path, notice: 'O Cliente foi cadastrado com sucesso!'
    else
      render :new
    end

  end

  def edit

  end

  def update
    if @client.update(client_params)
      redirect_to admin_clients_path, notice: 'O Cliente foi atualizado com sucesso!'
    else
      render :edit
    end
  end

  def destroy
    @client.destroy
    redirect_to admin_clients_path, notice: 'O Cliente foi excluído com sucesso!'

  end

  private

  def set_client
    @client = Client.find(params[:id])
  end

  def client_params
    params.require(:client).permit(:name, :address, :onwer, :phone, :cellphone, :email, :logotype, :description)
  end
end