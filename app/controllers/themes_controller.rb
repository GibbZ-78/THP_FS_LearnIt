class ThemesController < ApplicationController
  
  def index
    @themes = Theme.all
  end

  def show
    @theme = Theme.find(params[:id]) 
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