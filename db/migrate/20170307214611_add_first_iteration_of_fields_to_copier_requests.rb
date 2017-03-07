class AddFirstIterationOfFieldsToCopierRequests < ActiveRecord::Migration
  def change
    add_column :copier_requests, :req_name, :string
    add_column :copier_requests, :user_name, :string
    add_column :copier_requests, :user_phone, :string
    add_column :copier_requests, :user_email, :string
    add_column :copier_requests, :req_oem, :string
    add_column :copier_requests, :req_marketer, :string
    add_column :copier_requests, :req_pc_embedded, :boolean
    add_column :copier_requests, :req_embedded_platform, :string
    add_column :copier_requests, :req_pc_int_scanning, :boolean
    add_column :copier_requests, :req_pc_dependency, :boolean
    add_column :copier_requests, :req_pc_dependency_detail, :string
    add_column :copier_requests, :req_general_notes, :string
    add_column :copier_requests, :req_aka, :string
    add_column :copier_requests, :req_intro_date, :datetime
    add_column :copier_requests, :req_disc_date, :datetime
    add_column :copier_requests, :req_print, :boolean
    add_column :copier_requests, :req_copy, :boolean
    add_column :copier_requests, :req_scan, :boolean
    add_column :copier_requests, :req_fax, :boolean
  end
end
