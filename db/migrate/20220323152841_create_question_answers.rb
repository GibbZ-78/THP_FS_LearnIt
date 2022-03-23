class CreateQuestionAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :question_answers do |t|
      t.integer :quiz_id
      t.string :question
      t.string :correct_answer
      t.datetime :created_at
      t.datetime :updated_at
      t.belongs_to :quiz, index: true
      t.timestamps
    end
  end
end
