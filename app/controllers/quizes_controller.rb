class QuizesController < ApplicationController
  
  def index
    @quizes = Quiz.all
  end

  def show
    @quiz = Quiz.find(params[:id]) 
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