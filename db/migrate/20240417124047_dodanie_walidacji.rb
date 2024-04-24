class DodanieWalidacji < ActiveRecord::Migration[7.1]
  def change
    change_column_null :oferta, :id_stanowiska, false
    change_column_null :oferta, :id_branzy, false
    change_column_null :oferta, :id_firmy, false
    change_column_null :oferta, :tytul, false
    change_column_null :oferta, :rodzaj, false

    add_index :oferta, :id_stanowiska
    add_index :oferta, :id_branzy
    add_index :oferta, :id_firmy

    add_foreign_key :oferta, :stanowiskos, column: :id_stanowiska
    add_foreign_key :oferta, :branzas, column: :id_branzy
    add_foreign_key :oferta, :firmas, column: :id_firmy


    change_column_null :branzas, :nazwa, false
    change_column_null :firmas, :nazwa, false
    change_column_null :stanowiskos, :nazwa, false

    add_index :branzas, :nazwa, unique: true


    add_foreign_key :odpowiedzs, :oferta , column: :id_oferty

  end
end
