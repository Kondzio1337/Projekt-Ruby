class UzytkownicyController < ApplicationController

  def index
    if(user_signed_in? && current_user.admin?)
    @users = User.all
    else

      end
  end

end