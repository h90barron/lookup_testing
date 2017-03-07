class AddNameFieldToCopiers < ActiveRecord::Migration
  def change
    add_column :copiers, :name, :string
  end
end
