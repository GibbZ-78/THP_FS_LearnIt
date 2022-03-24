class CreateCourses < ActiveRecord::Migration[5.2]
  def change
    create_table :courses do |t|
      t.string :title
      t.text :content
      t.belongs_to :chapter, index: true
      t.timestamps
    end
  end
end
