class AddRefpriceToOrder < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :refprice, :string
  end
end
