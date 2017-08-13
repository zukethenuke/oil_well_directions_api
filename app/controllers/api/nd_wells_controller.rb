class Api::NdWellsController < ApplicationController
  def index
    @wells = NdWell.all
    # render 'index.json.jbuilder'
    render json: {wells: @wells}
  end

  def show
    @well = NdWell.where(id: params[:id])
    puts '1**************'
    p @well
    puts '2**************'
    # render 'show.json.jbuilder'
    render json: {well: @well}
  end

  def random
    @wells = NdWell.limit(20).order("RANDOM()")
    render json: {wells: @wells}
  end
end
