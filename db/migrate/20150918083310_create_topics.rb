class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.string :title
      t.integer :view
      t.integer :like
      t.integer :comment
      t.timestamps null: false
    end
  end
end
