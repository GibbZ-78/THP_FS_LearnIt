class ThemesController < ApplicationController
  
  before_action :require_admin, except: :index

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
    Theme.create(clean_params)
    redirect_to dashboard_admin_path
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

  def require_admin
    if !user_signed_in? || current_user.what_role? != "admin"
      redirect_to root_path
    end
  end

end