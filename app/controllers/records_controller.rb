class RecordsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  def index
    @records = Record.all
  end

  def show
    @record = Record.find(params[:id])
  end

  def new
    @record = Record.new
  end

  def create
    @record = Record.new(record_params)
    @record.save
    redirect_to record_show_path(@record) #double check this badboy
  end

  private

  def record_params
    params.require(:records).permit(:year, :title, :artist, :genre, :label, :price)
  end
end
