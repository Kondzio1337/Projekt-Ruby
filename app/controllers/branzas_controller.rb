class BranzasController < ApplicationController

  before_action :authenticate_user!, only: [:new]




#Akcja wyswietlająca wszystkie branze
  def index
    @Branza= Branza.all
  end
#Akcja wyswietlająca formularz tworzenia branzy
  def new
    @Branza=Branza.new
  end

#Akcja tworząca branze
  def create
    @Branza=Branza.new(branza_params)
    if @Branza.save
    redirect_to branzas_url
    else
      render :new, status: :unprocessable_entity
      end
  end
#Akcja zabezpieczająca przesyłane parametry formularza
  private
  def branza_params
    params.require(:branza).permit(:nazwa)
  end

end