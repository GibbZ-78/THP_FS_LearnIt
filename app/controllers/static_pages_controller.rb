class StaticPagesController < ApplicationController
  before_action :authenticate_user!

  def home
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
