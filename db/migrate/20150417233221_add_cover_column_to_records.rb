class AddCoverColumnToRecords < ActiveRecord::Migration
  def change
    add_column :records, :cover, :string
  end
end
