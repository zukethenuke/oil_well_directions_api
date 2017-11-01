class Api::NdWellsController < ApplicationController
  def index
    if params

    else
      @wells = NdWell.all
      # render 'index.json.jbuilder'
      render json: {wells: @wells}
    end
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

  def all_operators
    @operators = NdWell.select(:current_operator).distinct
    render json: {operators: @operators}
  end
end
