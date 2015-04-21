class CreateJoinTableListsRecords < ActiveRecord::Migration
  def change
  	create_join_table :lists, :records do |t|
  t.index :list_id
  t.index :record_id
end
  end
end
