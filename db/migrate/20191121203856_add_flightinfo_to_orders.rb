class AddFlightinfoToOrders < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :flightinfo, :string
  end
end
