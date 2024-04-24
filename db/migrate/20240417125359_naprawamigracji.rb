class Naprawamigracji < ActiveRecord::Migration[7.1]
  def change
    remove_foreign_key :odpowiedzs, :oferta

    add_foreign_key :odpowiedzs, :oferta , column: :id_oferty
  end
end
