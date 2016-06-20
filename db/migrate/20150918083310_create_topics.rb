class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.string :title
      t.integer :view
      t.integer :like
      t.timestamps null: false
    end
  end
end
