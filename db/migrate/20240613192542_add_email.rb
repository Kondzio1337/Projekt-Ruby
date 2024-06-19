class AddEmail < ActiveRecord::Migration[7.1]
  def change
    add_column :odpowiedzs, :email, :string
  end
end
