class ErrorsController < ApplicationController

  #wyswietlenie strone błedu -nieznaleziono strony
  def not_found
    render status: 404 , layout: false
  end
  #wyswietlamy strone błedu-wewnetrzny blad serwera
  def internal_server_error
    render status: 500,layout: false
  end
end
