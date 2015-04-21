class DropTableRecordslists < ActiveRecord::Migration
  def change
  	drop_table :recordslists
  end
end
