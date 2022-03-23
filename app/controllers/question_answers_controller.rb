class QuestionAnswersController < ApplicationController

  def index
    @question_answers = Question_answer.all
  end

  def show
    @question_answer = Question_answer.find(params[:id]) 
  end

  #def edit
  #end

  #def update
  #end

  #def new
  #end

  #def create
  #end

  #def destroy
  #end

end