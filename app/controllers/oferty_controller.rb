class OfertyController < ApplicationController
  def index
    if params[:branza_id].present?
      @oferty = Ofertum.where(id_branzy: params[:branza_id])
    else
      @oferty = Ofertum.all
    end
    @branze = Branza.all
    @firma = Firma.all
    @stanowisko = Stanowisko.all
  end

  def new
    @oferty = Ofertum.new
    @branze = Branza.all
    @firma = Firma.all
    @stanowisko = Stanowisko.all
  end

  def create

    @oferty = Ofertum.new(ofertum_params)
    @branze = Branza.all
    @firma = Firma.all
    @stanowisko = Stanowisko.all
    if @oferty.save
      redirect_to oferty_url
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
  def ofertum_params
    params.require(:ofertum).permit(:tytul, :id_branzy, :id_stanowiska, :id_firmy, :rodzaj)
  end

end