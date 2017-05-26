class Api::NdWellsController < ApplicationController
  def index
    @wells = NdWell.all
    render 'index.json.jbuilder'
  end

  def show
    @well = NdWell.where(id: params[:id])
    puts '1**************'
    p @well
    puts '2**************'
    render 'show.json.jbuilder'
  end
end
