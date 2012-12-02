class AddIsReviewedToEntry < ActiveRecord::Migration
  def change
    add_column :entries, :is_reviewed, :boolean
  end
end
