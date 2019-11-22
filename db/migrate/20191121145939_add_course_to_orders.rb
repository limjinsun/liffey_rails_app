class AddCourseToOrders < ActiveRecord::Migration[6.0]
  def change
    add_reference :orders, :course, null: true, foreign_key: true
  end
end
