class AddSchooltagToSchools < ActiveRecord::Migration[6.0]
  def change
    add_column :schools, :schooltag, :string
  end
end
