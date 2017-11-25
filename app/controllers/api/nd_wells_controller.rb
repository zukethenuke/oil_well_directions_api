class Api::NdWellsController < ApplicationController
  def index
    # if params

    # else
      @wells = NdWell.all
      # render 'index.json.jbuilder'
      render json: {wells: @wells}
    # end
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
    # @operators = NdWell.select(:current_operator).distinct # return array of objects with id & current_operator
    @operators = NdWell.pluck(:current_operator).uniq # returns array of current_operators
    render json: {operators: @operators}
  end

  def all_lease_names
    @leases = NdWell.pluck(:lease_name)
  end

  def app_startup_data
    @data = NdWell.select(:id, :current_operator, :current_well_name).where.not(well_status: ['DRY', 'PA', 'PNC'])
    render json: {wells: @data}
  end
end
