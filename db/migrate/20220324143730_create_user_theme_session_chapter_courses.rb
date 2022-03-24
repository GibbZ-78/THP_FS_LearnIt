class CreateUserThemeSessionChapterCourses < ActiveRecord::Migration[5.2]
  def change
    create_table :user_theme_session_chapter_courses do |t|

      t.timestamps
    end
  end
end
