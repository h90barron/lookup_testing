class RemoveOldsColumns < ActiveRecord::Migration
  def change
    remove_column :copiers, :pc_int_scanning
    remove_column :copiers, :pc_dependency_detail 
    remove_column :copiers, :pc_dependency
    remove_column :copiers, :vending_connector
    remove_column :copiers, :vending_connector_ex
    remove_column :copiers, :vending_connector_cpad
    remove_column :copiers, :card_reader_mode
    remove_column :copiers, :card_reader_types
    remove_column :copiers, :pc_embedded
  end
end

