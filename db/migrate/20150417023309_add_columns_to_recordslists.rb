class AddColumnsToRecordslists < ActiveRecord::Migration
  def change
    add_reference :recordslists, :record, index: true, foreign_key: true
    add_reference :recordslists, :list, index: true, foreign_key: true
  end
end
