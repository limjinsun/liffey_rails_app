class CreateCourses < ActiveRecord::Migration[6.0]
  def change
    create_table :courses do |t|
      t.string :name
      t.decimal :price, precision: 10, scale: 2
      t.decimal :specialprice, precision: 10, scale: 2
      t.datetime :specialdue
      t.string :description
      t.string :admintext

      t.timestamps
    end
  end
end
