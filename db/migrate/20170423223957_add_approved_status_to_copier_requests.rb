class AddApprovedStatusToCopierRequests < ActiveRecord::Migration
  def change
    add_column :copier_requests, :req_approved_status, :boolean, :default => false
  end
end
