class FirmaController < ApplicationController

  def index
    @Firma= Firma.all
  end
  def new
    @Firma=Firma.new
  end
  def create
    @Firma=Firma.new(firma_params)
    if @Firma.save
      redirect_to firma_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
  def firma_params
    params.require(:firma).permit(:nazwa)
  end

end