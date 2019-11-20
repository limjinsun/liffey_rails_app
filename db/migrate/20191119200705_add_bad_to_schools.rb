class AddBadToSchools < ActiveRecord::Migration[6.0]
  def change
    add_column :schools, :bad, :string
  end
end
