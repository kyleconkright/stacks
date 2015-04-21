class DropTable < ActiveRecord::Migration
  def change
  	drop_table :recordlists
  end
end
