class FirmaController < ApplicationController

  before_action :authenticate_user!, only: [:new]
  def index
    if  (user_signed_in?)
    @Firma= Firma.where(user_id: current_user.id)

    else
      @Firma= Firma.all
      end
  end
  def new
    @Firma=Firma.new
  end
  def create
    @Firma=Firma.new(firma_params)
    @Firma.user_id = current_user.id
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