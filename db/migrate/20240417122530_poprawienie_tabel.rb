class PoprawienieTabel < ActiveRecord::Migration[7.1]
  def change
    remove_column :oferta, :id_oferty, :integer
    remove_column :firmas, :id_firmy, :integer
    remove_column :branzas, :id_branzy, :integer
    remove_column :stanowiskos, :id_stanowiska, :integer
  end
end
