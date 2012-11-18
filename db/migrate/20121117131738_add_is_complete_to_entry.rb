class AddIsCompleteToEntry < ActiveRecord::Migration
  def change
    add_column :entries, :is_complete, :boolean
  end
end
