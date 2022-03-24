class CreateQuizzes < ActiveRecord::Migration[5.2]
  def change
    create_table :quizzes do |t|
      t.string :title
      t.belongs_to :course, index: true
      t.timestamps
    end
  end
end
