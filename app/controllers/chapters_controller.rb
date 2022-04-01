class ChaptersController < ApplicationController

  def index
    @chapters = Chapter.all
  end

  def show
    @chapter = Chapter.find(params[:id]) 
  end

  def new
    @chapter = Chapter.new
  end

  def create
    Chapter.create(clean_params)
    redirect_to dashboard_admin_path
  end

  def edit
    @chapter = Chapter.find(params[:id]) 
  end

  def update
    @chapter = Chapter.find(params[:id])
    @chapter.update(clean_params)
    redirect_to dashboard_admin_path
  end

  def destroy
    @chapter = Chapter.find(params[:id])
    @chapter.destroy
    redirect_to dashboard_admin_path
  end

  private

  def clean_params
    params.require(:chapter).permit(:title, :content, :theme_id)
  end

end