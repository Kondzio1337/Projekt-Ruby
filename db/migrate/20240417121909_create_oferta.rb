class CreateOferta < ActiveRecord::Migration[7.1]
  def change
    create_table :oferta do |t|
      t.integer :id_branzy
      t.integer :id_stanowiska
      t.integer :id_firmy
      t.integer :id_oferty
      t.string :tytul

      t.timestamps
    end
  end
end
