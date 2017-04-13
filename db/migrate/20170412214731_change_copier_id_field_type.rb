class ChangeCopierIdFieldType < ActiveRecord::Migration
  def change
    remove_column :copier_requests, :c_id
    add_column :copier_requests, :copr_id, :string
  end
end
