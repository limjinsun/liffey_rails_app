class AddCourseToOrders < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :course, :string
  end
end
