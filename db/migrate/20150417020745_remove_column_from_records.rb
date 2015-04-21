class RemoveColumnFromRecords < ActiveRecord::Migration
  def change
    remove_column :records, :user_id, :string
  end
end
