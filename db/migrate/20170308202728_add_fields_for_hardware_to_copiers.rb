class AddFieldsForHardwareToCopiers < ActiveRecord::Migration
  def change
    add_column :copiers, :card_reader_support, :boolean
    add_column :copiers, :vending_connector, :boolean
    add_column :copiers, :vending_connector_oem, :string
    add_column :copiers, :vending_connector_ex, :string
    add_column :copiers, :vending_connector_cpad, :string
    add_column :copiers, :card_reader_mode, :string
    add_column :copiers, :card_reader_types, :string
  end
end
