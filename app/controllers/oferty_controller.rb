class OfertyController < ApplicationController

  before_action :authenticate_user!, only: [:new]
  #Akcja wyswietlająca oferty
  #@oferty- zawiera oferty wszystkie lub przefiltrowane przez branze
  def index
    if params[:branza_id].present?
      @oferty = Ofertum.where(id_branzy: params[:branza_id]).order(created_at: :desc)
    else
      @oferty = Ofertum.all.order(created_at: :desc)
    end
    @branze = Branza.all
    @firma = Firma.all
    @stanowisko = Stanowisko.all
  end


  #Akcja wyswietlająca wszystkie oferty danego uzytkownika z uwzględnieniem że moze miec kilka firm
  def twoje
    Rails.logger.info"Uzytkownik wyswietla swoje oferty"
    @firmy = Firma.where(user_id: current_user.id)

    firma_ids = @firmy.pluck(:id)

    @oferty = Ofertum.where(id_firmy: firma_ids)
    @branze = Branza.all
    @firma = Firma.all
    @stanowisko = Stanowisko.all

  end

  # Akcja wyswietlająca formularz tworzenia oferty
  def new
    @oferty = Ofertum.new
    @branze = Branza.all
    @firma = Firma.all
    @stanowisko = Stanowisko.all
  end


  # Akcja tworzaca nową oferte
  def create

    @oferty = Ofertum.new(ofertum_params)
    @branze = Branza.all
    @firma = Firma.all
    @stanowisko = Stanowisko.all
    @checkBox1=params[:my_checkbox1]
    @checkBox2=params[:my_checkbox2]
    @checkBox3=params[:my_checkbox3]
    @checkBox4=params[:my_checkbox4]
    @checkBox5=params[:my_checkbox5]
    @checkBox6=params[:my_checkbox6]
    #przetwarza dane z chechboxow i konwertuje na zapis ,,binarny"
    puts @checkBox1
    binary_value = ''
    (1..6).each do |i|
      checkbox_param = "my_checkbox#{i}".to_sym
      puts checkbox_param
      if params[checkbox_param] == '1'
        puts "True"
        binary_value += '1'
      else
        puts "False"
        binary_value += '0'
      end
    end

    @oferty.rodzaj = binary_value

    puts "Binary value: #{binary_value}"

    if @oferty.save
      redirect_to oferty_url
    else
      render :new, status: :unprocessable_entity
    end
  end
  # Metoda zabezpieczająca przesyłane parametry formularza
  # oczekujemy klucza-ofertum ktory jest nazwa modelu
  # okreslamy jakie parametry chcemy uzyskac
  private
  def ofertum_params
    params.require(:ofertum).permit(:tytul, :id_branzy, :id_stanowiska, :id_firmy)
  end

end