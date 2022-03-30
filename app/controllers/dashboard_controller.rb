class DashboardController < ApplicationController
  
  before_action :authenticate_user!
  
  def index
    if !user_signed_in?
      puts "DEBUG - Entering 'dashboard#index' with a non-connected user"
      puts "        > Redirecting to site root and status 401." 
      redirect_to(root_path, status: 302)
    else
      puts "DEBUG - Entering 'dashboard#index' with user #{current_user.first_name} #{current_user.last_name} (#{current_user.id}) with role #{current_user.what_role?} on #{Time.now}."
      case current_user.what_role?
      when "mentor"
        # Redirecting to dashboard#mentor
        puts "        > Redirecting to 'dashboard#mentor' controller then related 'mentor dashboard'." 
        # redirect_to(dashboard_mentor_path, status: 302)
      when "admin"
        # Redirecting to dashboard#admin
        puts "        > Redirecting to 'dashboard#admin' controller then related 'admin dashboard'." 
        redirect_to(dashboard_admin_path, status: 302)
      else
        # By default, redirecting to dashboard#student
        puts "        > Redirecting to 'dashboard#student' controller then related 'student dashboard'." 
        redirect_to(dashboard_student_path, status: 302)
      end
    end
  end

  def student
    #Affichage des thèmatiques liées au user actuel
    @id = current_user.id
    @themes_du_user = UserThemeSeason.where(user_id: @id)
    
    respond_to do |format|
      format.html { }
      # format.js { @themes_du_user }
      format.js {  }
    end
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
