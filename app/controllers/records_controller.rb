class RecordsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @records = Record.where.not(latitude: nil, longitude: nil)
    @markers = @records.map do |record|
      {
        lat: record.latitude,
        lng: record.longitude,
        # infoWindow: { content: render_to_string(partial: "/flats/map_box", locals: { flat: flat }) }
      }
      
    if params[:query].present?
      sql_query = " \
        records.title @@ :query \
        OR records.artist @@ :query \
        OR records.genre @@ :query \
      "
      @records = Record.where(sql_query, query: "%#{params[:query]}%")
    else
      @records = Record.all
    end
  end

  def show
    @record = Record.find(params[:id])
  end

  def new
    @record = Record.new
  end

  def create
    @record = Record.new(record_params)
    @record.user = current_user
    @record.save
    redirect_to record_path(@record)
  end

  def edit
    @record = Record.find(params[:id])
  end

  def update
    @record = Record.find(params[:id])
    @record.user = current_user
    @record.update(record_params)
    redirect_to record_path(@record)
  end

  def destroy
    @record = Record.find(params[:id])
    @record.user = current_user
    @record.destroy
    redirect_to records_path
    # redirect_to pages_dashboard once created
  end

  private

  def record_params
    params.require(:record).permit(:year, :title, :artist, :genre, :label, :price)
  end
end


