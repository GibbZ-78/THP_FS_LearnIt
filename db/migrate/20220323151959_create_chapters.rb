class CreateChapters < ActiveRecord::Migration[5.2]
  def change
    create_table :chapters do |t|
      t.integer :theme_id
      t.string :title
      t.text :content
      t.datetime :created_at
      t.datetime :updated_at
      t.belongs_to :theme, index: true
      t.timestamps
    end
  end
end
