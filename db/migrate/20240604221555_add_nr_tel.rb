class AddNrTel < ActiveRecord::Migration[7.1]
  def change
    add_column :oferta, :nr_tel, :integer
  end
end
