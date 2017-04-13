class AddCopierIdFieldToCopierRequests < ActiveRecord::Migration
  def change
    add_column  :copier_requests, :c_id, :integer
  end
end
