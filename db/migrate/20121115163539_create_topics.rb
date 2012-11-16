class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.string :title
      t.text :questions
      t.date :due_on
      t.date :active_on

      t.timestamps
    end
  end
end
