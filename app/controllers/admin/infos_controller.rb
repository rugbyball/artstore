class Admin::InfosController < ApplicationController
  layout "admin"

  before_action :authenticate_user!
  before_action :admin_required

  def index
    #@infos = Info.all
    @infos = Info.order("ordinal ASC")
  end

  #def show
  #  @info = Info.find(params[:id])
  #end

  def new
    @info = Info.new
    #@photo = @info.photos.new
  end

  def create
    @info = Info.new(info_params)

    if @info.save
      redirect_to admin_infos_path(@info), notice: "新增資訊成功！"
    else
      render :new
    end
  end

  def edit
    @info = Info.find(params[:id])
    #@info = Info.find(params[:info_id])
    #@info = Info.find(1)
  end

  def update
    @info = Info.find(params[:id])

    if @info.update(info_params)
      redirect_to admin_infos_path(@info), notice: "修改資訊成功！"
    else
      render :edit
    end
  end

  def destroy
    @info = Info.find(params[:id])
    @info.destroy
    redirect_to admin_infos_path(@info), notice: "資訊已刪除！"
  end

  private

  def info_params
    params.require(:info).permit(:title, :description, :ordinal)
  end

end
