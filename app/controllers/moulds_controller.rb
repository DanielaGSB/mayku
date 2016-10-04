class MouldsController < ApplicationController
  def index
    @moulds = Mould.all.order("created_at DESC")
  end

  def new
    @mould = Mould.new
  end

  def show
    @mould = Mould.find(params[:id])
  end

  def create
    @mould = Mould.create(mould_params)
    if @mould.save
      flash[:notice] = 'Nice, mould uploaded'
      redirect_to moulds_path
    else
      flash[:alert] = 'Please upload a mould'
      render :new
    end
  end

private

  def mould_params
    params.require(:mould).permit(:image, :name)
  end
end
