class CreateCopierRequests < ActiveRecord::Migration
  def change
    create_table :copier_requests do |t|

      t.timestamps null: false
    end
  end
end
