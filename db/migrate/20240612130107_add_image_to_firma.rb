class AddImageToFirma < ActiveRecord::Migration[7.1]
  def change
    add_column :firmas, :image, :string
  end
end
