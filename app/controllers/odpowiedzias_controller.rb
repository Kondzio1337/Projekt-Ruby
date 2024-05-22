class OdpowiedziasController < ApplicationController

  def index
    @odpowiedzi = Odpowiedz.all

  end
  def firma
    @firma = Firma.where(user_id: current_user.id).first
    firma_id = @firma.id
    oferty  = Ofertum.where(id_firmy: firma_id)
    @odpowiedzi = []

    oferty.each do |oferta|

      @odpowiedzi += Odpowiedz.where(id_oferty: oferta.id)
    end


  end
    def respond
      @oferta = Ofertum.find(params[:id])
      @odpowiedz = Odpowiedz.new
      @rodzaj=@oferta.rodzaj
      # Tutaj dodaj logikę obsługi odpowiedzi na ofertę
    end

    def create
      @oferta = Ofertum.find(params[:oferta_id])
        @odpowiedz = Odpowiedz.new(odpoweidz_params)
      @odpowiedz.id_oferty = @oferta.id




      if @odpowiedz.save
        redirect_to @odpowiedz, notice: 'Odpowiedź została pomyślnie zapisana.'
      else
        Rails.logger.info("Gówno nie działa")
        render :respond
      end
    end

    private
    def odpoweidz_params
      params.require(:odpowiedz).permit(:wiek, :imie, :nazwisko, :miejsce_zamieszaknia, :staz , :rodzaj_wyksztalcenia)
    end
  end


