class OdpowiedziasController < ApplicationController

  def index
    @odpowiedzi = Odpowiedz.all

  end
  #Akcja wyswietlajaca wszystkie odpowiedzi dla danej firmy/firm
  def firma
    @firma = Firma.where(user_id: current_user.id)
    firma_id = @firma.pluck(:id)
    oferty  = Ofertum.where(id_firmy: firma_id)
    @odpowiedzi = []

    oferty.each do |oferta|

      @odpowiedzi += Odpowiedz.where(id_oferty: oferta.id).order(created_at: :desc)

    end

    #Akcja wyswietlajaca szczegoly danej odpowiedzi
    def szczegoly
      @odpowiedz=Odpowiedz.find(params[:id])
    end

  end

  #Akcja wyswietla formularz odpowiedzi na dana oferte
    def respond
      @oferta = Ofertum.find(params[:id])
      @odpowiedz = Odpowiedz.new
      @rodzaj=@oferta.rodzaj

    end
  #Akcja tworzy odpowiedz na podstawie danych z formularza
    def create
      @oferta = Ofertum.find(params[:oferta_id])
        @odpowiedz = Odpowiedz.new(odpoweidz_params)
      @odpowiedz.id_oferty = @oferta.id

      if @odpowiedz.save
        redirect_to "/oferty", notice: 'Odpowiedź została pomyślnie zapisana.'
      else
        Rails.logger.info("Nie udało sie zapisać odpowiedzi")
        render :respond
      end
    end
  #Metoda zabezpieczajaca przesylane parametry formularza
    private
    def odpoweidz_params
      params.require(:odpowiedz).permit(:wiek, :imie, :nazwisko, :miejsce_zamieszaknia, :staz , :rodzaj_wyksztalcenia,:nr_tel,:email)
    end
  end


