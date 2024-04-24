class DodanieRodzajuOfert < ActiveRecord::Migration[7.1]
  def change
    add_column :oferta, :rodzaj, :integer
  end
end
