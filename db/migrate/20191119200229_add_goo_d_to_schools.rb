class AddGooDToSchools < ActiveRecord::Migration[6.0]
  def change
    add_column :schools, :good, :string
  end
end
