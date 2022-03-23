class CreateCourses < ActiveRecord::Migration[5.2]
  def change
    create_table :courses do |t|
      t.integer :chapter_id
      t.string :title
      t.text :content
      t.datetime :created_at
      t.datetime :updated_at
      t.belongs_to :chapter, index: true
      t.timestamps
    end
  end
end
