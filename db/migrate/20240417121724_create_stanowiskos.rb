class CreateStanowiskos < ActiveRecord::Migration[7.1]
  def change
    create_table :stanowiskos do |t|
      t.integer :id_stanowiska
      t.string :nazwa

      t.timestamps
    end
  end
end
