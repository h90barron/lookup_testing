class ChangeOemHarnessFieldNameForCopierRequests < ActiveRecord::Migration
  def change
    rename_column :copier_requests, :oem_vending_harness_01, :req_oem_vending_harness_01
  end
end
