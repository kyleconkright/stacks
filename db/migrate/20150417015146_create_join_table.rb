class CreateJoinTable < ActiveRecord::Migration
  def change
  	create_join_table :records, :lists, table_name: :recordlists
  end
end
