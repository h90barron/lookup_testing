class ModifyCopierRequestTableForNewData < ActiveRecord::Migration
  def change
    
    rename_column :copier_requests, :req_vending_connector_oem, :oem_vending_harness_01
    
    remove_column :copier_requests, :req_pc_int_scanning
    remove_column :copier_requests, :req_pc_dependency_detail 
    remove_column :copier_requests, :req_pc_dependency
    remove_column :copier_requests, :req_vending_connector
    remove_column :copier_requests, :req_vending_connector_ex
    remove_column :copier_requests, :req_vending_connector_cpad
    remove_column :copier_requests, :req_card_reader_mode
    remove_column :copier_requests, :req_card_reader_types
    remove_column :copier_requests, :req_pc_embedded
    
    add_column :copier_requests, :req_acdi_vending_harness_01, :string
    add_column :copier_requests, :req_pcb_details_01, :text
    add_column :copier_requests, :req_acdi_vending_harness_02, :string
    add_column :copier_requests, :req_oem_vending_harness_02, :string
    add_column :copier_requests, :req_pcb_details_02, :text
    add_column :copier_requests, :req_name_details, :string
    add_column :copier_requests, :req_model_type, :string
    add_column :copier_requests, :req_manufacturing_status, :string
    add_column :copier_requests, :req_print_speed, :string
    add_column :copier_requests, :req_supported_name, :string
    add_column :copier_requests, :req_supported_notes_01, :string
    add_column :copier_requests, :req_supported_notes_02, :string
    add_column :copier_requests, :req_manufacturer, :string
    add_column :copier_requests, :req_supported_status, :string
  end
end
