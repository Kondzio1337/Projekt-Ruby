class AddUserToFirma < ActiveRecord::Migration[7.1]
  def change
    add_column :firmas, :user_id, :integer
  end
end
