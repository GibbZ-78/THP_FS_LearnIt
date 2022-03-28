class ChaptersController < ApplicationController

  def index
    @chapters = Chapter.all
  end

  def show
    @chapter = Chapter.find(params[:id]) 
  end

  #def new
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