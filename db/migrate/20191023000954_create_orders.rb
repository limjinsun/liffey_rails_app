class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.string :name
      t.string :address
      t.string :school
      t.datetime :arrival
      t.string :duration_homestay
      t.string :exitexam
      t.boolean :medical_insurance
      t.datetime :vacation1_start
      t.datetime :vacation1_end
      t.datetime :vacation2_start
      t.datetime :vacation2_end

      t.timestamps
    end
  end
end
