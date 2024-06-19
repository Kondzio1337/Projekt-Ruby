class StanowiskaController < ApplicationController


  #Akcja wyswietlająca wszystkie stanowiska
  def index
    @Stanowisko= Stanowisko.all
  end
  #Akcja wyswietlająca formularz dodawania stanowiska
  def new
    @Stanowisko=Stanowisko.new
  end

  #Akcja ktora tworzy nowe stanowisko z danych z formularza
  def create
    @Stanowisko=Stanowisko.new(stanowisko_params)
    if @Stanowisko.save
      redirect_to stanowiska_url
    else
      render :new, status: :unprocessable_entity
    end
  end

  #Metoda zabezpieczająca przesyłane parametry formularza
  private
  def stanowisko_params
    params.require(:stanowisko).permit(:nazwa)
  end

end