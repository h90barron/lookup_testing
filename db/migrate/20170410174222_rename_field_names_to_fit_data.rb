class RenameFieldNamesToFitData < ActiveRecord::Migration
  def change
    rename_column :copiers, :vending_connector_oem, :oem_vending_harness_01
  end
end
