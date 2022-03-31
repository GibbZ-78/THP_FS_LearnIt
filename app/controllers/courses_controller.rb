class CoursesController < ApplicationController
  
  def index
    @courses = Course.all
  end

  def show
    @course = Course.find(params[:id])
    @course_chapter = @course.chapter
    @courses = Course.where(chapter_id:@course_chapter.id)
    #@courses_of_the_same_chapter = Course.where(chapter_id:@courses.chapter_id) #test
    #@next_course = Course.where(chapter_id:@courses.chapter_id, course_id:(@course.id +1)) #test for the button "next course"
    @next_course = Course.find_by_id(params[:id].to_i + 1)
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