class AddSecondarycourseToOrders < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :extracoursename, :string
  end
end
