class AddNewColumnsForData < ActiveRecord::Migration
  def change
    add_column :copiers, :old_db_id, :string
    add_column :copiers, :acdi_vending_harness_01, :string
    add_column :copiers, :pcb_details_01, :text
    add_column :copiers, :acdi_vending_harness_02, :string
    add_column :copiers, :oem_vending_harness_02, :string
    add_column :copiers, :pcb_details_02, :text
    add_column :copiers, :name_details, :string
    add_column :copiers, :model_type, :string
    add_column :copiers, :manufacturing_status, :string
    add_column :copiers, :print_speed, :string
    add_column :copiers, :supported_name, :string
    add_column :copiers, :supported_notes_01, :string
    add_column :copiers, :supported_notes_02, :string
    add_column :copiers, :manufacturer, :string
    add_column :copiers, :supported_status, :string
  end
end
