class StanowiskaController < ApplicationController

  def index
    @Stanowisko= Stanowisko.all
  end
  def new
    @Stanowisko=Stanowisko.new
  end
  def create
    @Stanowisko=Stanowisko.new(stanowisko_params)
    if @Stanowisko.save
      redirect_to stanowiska_url
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
  def stanowisko_params
    params.require(:stanowisko).permit(:nazwa)
  end

end