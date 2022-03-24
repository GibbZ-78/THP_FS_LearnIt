class CoursesController < ApplicationController
  
  def index
    @courses = Course.all
  end

  def show
    @course = Course.find(params[:id]) 
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