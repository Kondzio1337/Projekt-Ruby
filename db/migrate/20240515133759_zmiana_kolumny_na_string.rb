class ZmianaKolumnyNaString < ActiveRecord::Migration[7.1]
  def change
    change_column :oferta, :rodzaj, :string
  end
end
