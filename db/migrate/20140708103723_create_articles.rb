class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title, null: false
      t.string :perex
      t.integer :zive_id

      t.timestamps
    end
  end
end
