class OfertyController < ApplicationController
  def index
    @oferty = Ofertum.all
  end
end