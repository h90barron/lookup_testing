class AddNewFieldsToRequests < ActiveRecord::Migration
  def change
    add_column :copier_requests, :req_card_reader_support, :boolean
    add_column :copier_requests, :req_vending_connector, :boolean
    add_column :copier_requests, :req_vending_connector_oem, :string
    add_column :copier_requests, :req_vending_connector_ex, :string
    add_column :copier_requests, :req_vending_connector_cpad, :string
    add_column :copier_requests, :req_card_reader_mode, :string
    add_column :copier_requests, :req_card_reader_types, :string
  end
end
