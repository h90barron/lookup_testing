class AddOemToCopiers < ActiveRecord::Migration
  def change
    add_column :copiers, :oem, :string
  end
end
