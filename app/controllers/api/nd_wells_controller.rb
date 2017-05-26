class Api::NdWellsController < ApplicationController
  def index
    @wells = NdWell.all
    render 'index.json.jbuilder'
  end
end
