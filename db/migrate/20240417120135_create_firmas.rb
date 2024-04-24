class CreateFirmas < ActiveRecord::Migration[7.1]
  def change
    create_table :firmas do |t|
      t.integer :id_firmy
      t.string :nazwa

      t.timestamps
    end
  end
end
