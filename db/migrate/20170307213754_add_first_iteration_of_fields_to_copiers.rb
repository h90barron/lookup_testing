class AddFirstIterationOfFieldsToCopiers < ActiveRecord::Migration
  def change
    add_column :copiers, :oem, :string
    add_column :copiers, :marketer, :string
    add_column :copiers, :pc_embedded, :boolean
    add_column :copiers, :embedded_platform, :string
    add_column :copiers, :pc_int_scanning, :boolean
    add_column :copiers, :pc_dependency, :boolean
    add_column :copiers, :pc_dependency_detail, :string
    add_column :copiers, :general_notes, :string
    add_column :copiers, :aka, :string
    add_column :copiers, :intro_date, :datetime
    add_column :copiers, :disc_date, :datetime
    add_column :copiers, :print, :boolean
    add_column :copiers, :copy, :boolean
    add_column :copiers, :scan, :boolean
    add_column :copiers, :fax, :boolean
  end
end
