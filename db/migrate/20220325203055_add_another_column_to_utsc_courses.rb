class AddAnotherColumnToUtscCourses < ActiveRecord::Migration[5.2]
  def change
    add_reference :utsc_courses, :course, foreign_key: true
  end
end
