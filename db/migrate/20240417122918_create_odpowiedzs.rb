class CreateOdpowiedzs < ActiveRecord::Migration[7.1]
  def change
    create_table :odpowiedzs do |t|
      t.integer :id_oferty
      t.integer :wiek
      t.integer :rodzaj_wyksztalcenia
      t.string :miejsce_zamieszaknia
      t.boolean :staz

      t.timestamps
    end
  end
end
