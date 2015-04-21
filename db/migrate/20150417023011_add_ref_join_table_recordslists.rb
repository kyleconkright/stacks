class AddRefJoinTableRecordslists < ActiveRecord::Migration
  def change
  	add_foreign_key :records, :lists
  end
end
