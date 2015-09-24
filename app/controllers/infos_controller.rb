class InfosController < ApplicationController

  def show
    @infos = Info.all
    @info = Info.find(params[:id])
  end

end
