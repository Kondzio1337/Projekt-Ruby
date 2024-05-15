class BranzasController < ApplicationController

  before_action :authenticate_user!, only: [:new]
  def index
    @Branza= Branza.all
  end
  def new
    @Branza=Branza.new
  end
  def create
    @Branza=Branza.new(branza_params)
    if @Branza.save
    redirect_to branzas_url
    else
      render :new, status: :unprocessable_entity
      end
  end

  private
  def branza_params
    params.require(:branza).permit(:nazwa)
  end

end