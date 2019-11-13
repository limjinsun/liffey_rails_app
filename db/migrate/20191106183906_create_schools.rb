class CreateSchools < ActiveRecord::Migration[6.0]
  def change
    create_table :schools do |t|
      t.string :name
      t.string :location
      t.string :size
      t.string :s_type
      t.string :classsize
      t.string :certificate
      t.decimal :admissionfee, precision: 10, scale: 2
      t.decimal :textbookfee, precision: 10, scale: 2
      t.decimal :insurancefee, precision: 10, scale: 2
      t.decimal :examfee, precision: 10, scale: 2
      t.decimal :hostbookingfee, precision: 10, scale: 2
      t.decimal :hostfeeperweek, precision: 10, scale: 2
      t.string :address
      t.string :fb
      t.string :insta
      t.string :youtube
      t.string :web
      t.string :wiki
      t.decimal :longitude, precision: 10, scale: 7
      t.decimal :latitude, precision: 10, scale: 7
      t.string :desc
      t.string :admintext
      t.string :nationalmix
      t.string :towndistance
      t.string :activity
      t.string :status

      t.timestamps
    end
  end
end
