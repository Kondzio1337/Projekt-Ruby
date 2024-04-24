class CreateBranzas < ActiveRecord::Migration[7.1]
  def change
    create_table :branzas do |t|
      t.integer :id_branzy
      t.string :nazwa

      t.timestamps
    end
  end
end
