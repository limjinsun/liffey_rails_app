class CreateOrderConfirms < ActiveRecord::Migration[6.0]
  def change
    create_table :order_confirms do |t|
      t.string :status

      t.timestamps
    end
  end
end
