class CreateUtscCourses < ActiveRecord::Migration[5.2]
  def change
    create_table :utsc_courses do |t|

      t.timestamps
    end
  end
end
