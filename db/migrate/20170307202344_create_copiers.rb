class CreateCopiers < ActiveRecord::Migration
  def change
    create_table :copiers do |t|

      t.timestamps null: false
    end
  end
end
