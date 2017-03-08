class RemoveOemFieldFromCopiers < ActiveRecord::Migration
  def change
    remove_column :copiers, :oem, :string
  end
end
