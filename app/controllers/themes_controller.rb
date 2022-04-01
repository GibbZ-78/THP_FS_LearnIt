class ThemesController < ApplicationController
  
  def index
    @themes = Theme.all
  end

  def show
    @theme = Theme.find(params[:id])
  end

  def new
    @theme = Theme.new
  end

  def create
    @theme.create(clean_params)
  end

  def edit
    @theme = Theme.find(params[:id])
  end

  def update
    @theme = Theme.find(params[:id])
    @theme.update(clean_params)
    redirect_to dashboard_admin_path
  end

  def destroy
    @theme = Theme.find(params[:id])
    @theme.destroy
    redirect_to dashboard_admin_path
  end

  private

  def clean_params
    params.require(:theme).permit(:title, :content)
  end

end