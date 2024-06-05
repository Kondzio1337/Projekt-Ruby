class AddNrTel2 < ActiveRecord::Migration[7.1]
  def change
    add_column :odpowiedzs, :nr_tel, :string
  end
end
