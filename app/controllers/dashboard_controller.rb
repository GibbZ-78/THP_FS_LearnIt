class DashboardController < ApplicationController
  
  # Invoking DEVISE to benefit from "user_signed_in?" and "current_user" helpers
  before_action :authenticate_user!
  
  # JBV - Proposition d'approche du branchement vers le dashboard dédié à chaque population
  #       TO DO: Vérifier adéquation des code HTTP de redirection / erreur
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
        # redirect_to(dashboard_student_path, status: 302)
      end
    end
  end

  def student
  end

  def mentor
  end

  # Manages access to "Admin Dashboard"
  def admin
    if !user_signed_in? || current_user.what_role? != "admin"
      puts "DEBUG - Entering 'dashboard#admin' with a non-connected user >> Redirecting to site root and status 401." 
      redirect_to(root_path, status: 401, flash: "Sorry, you're not authorized to access this part of LearnIt!.")
    else
      puts "DEBUG - Entering 'dashboard#admin' with user #{current_user.first_name} #{current_user.last_name} (#{current_user.id}) with role #{current_user.what_role?} on #{Time.now}."
    end
  end

end
