class CreateQuestionAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :question_answers do |t|
      t.string :question
      t.string :correct_answer
      t.belongs_to :quiz, index: true
      t.timestamps
    end
  end
end
