class CreateVendorHarnesses < ActiveRecord::Migration
  def change
    create_table :vendor_harnesses do |t|
      t.string :name
      t.timestamps null: false
    end
  end
end
