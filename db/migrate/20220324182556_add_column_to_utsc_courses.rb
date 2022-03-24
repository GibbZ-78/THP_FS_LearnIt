class AddColumnToUtscCourses < ActiveRecord::Migration[5.2]
  def change
    add_reference :utsc_courses, :user_theme_season_chapter, foreign_key: true
    add_column :utsc_courses, :completed, :boolean, default: false
  end
end
