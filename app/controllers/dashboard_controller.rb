class DashboardController < ApplicationController
  
  before_action :authenticate_user!
  
  def index
    #Affichage des thèmatiques liées au user actuel
    @id = current_user.id
    @themes_du_user = UserThemeSeason.all.where(user_id: @id)
      
    # if current_user.role == "student"
    #   redirect_to 'dashboard#student'
    # end  
  end

  def student

  end

  def mentor
  end

  # Manages access to "Admin Dashboard"
  def admin
    if !user_signed_in? || current_user.what_role? != "admin"
      puts "DEBUG - Entering 'dashboard#admin' with a non-connected user >> Redirecting to site root"
      redirect_to(root_path, status: "401", flash: "Sorry, you're not authorized to access this part of LearnIt!.")
    else
      puts "DEBUG - Entering 'dashboard#admin' with user #{current_user.first_name} #{current_user.last_name} (#{current_user.id}) with role #{current_user.what_role?} on #{Time.now}"
    end
  end

end
