class CreateOems < ActiveRecord::Migration
  def change
    create_table :oems do |t|
      t.string :name
      
      t.timestamps null: false
    end
  end
end
