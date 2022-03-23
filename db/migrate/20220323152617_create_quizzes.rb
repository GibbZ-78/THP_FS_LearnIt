class CreateQuizzes < ActiveRecord::Migration[5.2]
  def change
    create_table :quizzes do |t|
      t.integer :course_id
      t.string :title
      t.datetime :created_at
      t.datetime :updated_at
      t.belongs_to :course, index: true
      t.timestamps
    end
  end
end
