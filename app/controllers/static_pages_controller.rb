class StaticPagesController < ApplicationController
    
  def home
    @future_seasons_themes = Season.where("start_date > ?", Date.today).all
  end
  
  def uikit
  end

  def about
  end

  def contact
  end

  def fees
  end

end
