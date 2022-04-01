class DashboardController < ApplicationController
  before_action :authenticate_user!
  
  def index
    if !user_signed_in?
      redirect_to(root_path, status: 302)
    else
      case current_user.what_role?
      when "mentor"
        redirect_to(dashboard_mentor_path, status: 302)
      when "admin"
        redirect_to(dashboard_admin_path, status: 302)
      else
        redirect_to(dashboard_student_path, status: 302)
      end
    end
  end

  def student
    @id = current_user.id
    @themes_du_user = UserThemeSeason.where(user_id: @id)

    @uts = UserThemeSeason.find_by(season_id: params[:season], theme_id: params[:theme], user_id: @id)
    
    @mentor = UsersGroup.where(group_id: Group.where(season_id: params[:season], user_id: @id))

    respond_to do |format|
      format.html { }
      format.js { @uts }
    end
  end

  def mentor
  end

  def admin
    if !user_signed_in? || current_user.what_role? != "admin"
      redirect_to(root_path, status: 401, flash: "Sorry, you're not authorized to access this part of LearnIt!.")
    end
  end

end
