class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.text :content
      t.references :user
      t.references :topic

      t.timestamps
    end
    add_index :entries, :user_id
    add_index :entries, :topic_id
  end
end
