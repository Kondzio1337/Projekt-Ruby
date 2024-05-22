class DodanieKolumndoOdpowiedzi < ActiveRecord::Migration[7.1]
  def change
    change_column(:odpowiedzs,:rodzaj_wyksztalcenia,:string)
    add_column(:odpowiedzs,:imie,:string)
    add_column"odpowiedzs" , :nazwisko , :string
  end
end
