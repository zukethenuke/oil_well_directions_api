class Api::NdWellsController < ApplicationController
  def index
    if params
      formated_search_value_array = params['searchValue'].split(' ').map {|val| "%#{val.upcase}%"}

      @wells = NdWell.where('current_operator || current_well_name || api_no ILIKE ALL ( array[?] )', formated_search_value_array)

      if to_many?(@wells)
        return render json: {error: @wells.length.to_s + ' results. Please be more specific.'}
      end
    else
      @wells = NdWell.all
      # render 'index.json.jbuilder'
    end
    render json: {wells: @wells}
  end

  def show
    @well = NdWell.where(id: params[:id])
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

  # def app_startup_data
  #   @data = NdWell.select(:id, :current_operator, :current_well_name).where.not(well_status: ['DRY', 'PA', 'PNC'])
  #   render json: {wells: @data}
  # end

  def to_many?(wells)
    wells.length > 200 ? true : false
  end
end
