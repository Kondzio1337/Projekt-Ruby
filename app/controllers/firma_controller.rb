class FirmaController < ApplicationController

  before_action :authenticate_user!, only: [:new]

  #-wyswietlenie firm wszystkich lub tylko zalogowanego uzytkownika
  def index
    if  (user_signed_in?)
    @Firma= Firma.where(user_id: current_user.id)

    else
      @Firma= Firma.all
      end
  end

  #wyswietlenie formularza dodawania firmy
  def new
    @Firma=Firma.new
  end

  #tworzymy nowa firme na podstawie danych z formularza
  def create
    @Firma=Firma.new(firma_params)
    @Firma.user_id = current_user.id
    if @Firma.save
      redirect_to firma_path
    else
      render :new, status: :unprocessable_entity
    end
  end
  #zabezpieczenie przesylanych parametrow formularza, aby tylko wymagane parametry mogly byc przekazywane
  private
  def firma_params
    params.require(:firma).permit(:nazwa, :image)
  end

end