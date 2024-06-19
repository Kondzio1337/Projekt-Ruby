class UzytkownicyController < ApplicationController


#Akcja sprawdzająca czy jestes adminem. Jezeli tak wyswietla wszystkich uzytkownikow
  def index
    if(user_signed_in? && current_user.admin?)
    @users = User.all
    else

      end
  end

end