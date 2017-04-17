class CreateHarnesses < ActiveRecord::Migration
  def change
    create_table :harnesses do |t|
      t.string :name
      
      t.timestamps null: false
    end
  end
end
