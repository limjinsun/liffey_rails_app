class RemoveSchoolFromOrders < ActiveRecord::Migration[6.0]
  def change

    remove_column :orders, :school, :string
  end
end
