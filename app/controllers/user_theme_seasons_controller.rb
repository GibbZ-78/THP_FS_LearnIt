class UserThemeSeasonsController < ApplicationController

  def create
    da_user_id = params[:the_user]
    da_theme_id = params[:the_theme]
    da_season_id = params[:the_season]

    if UserSeason.where(user_id: da_user_id, season_id: da_season_id).exists?
      flash[:danger ] = "Vous êtes déjà inscris pour ce thème"
    else
      my_last_user_season = UserSeason.create(user_id: da_user_id, season_id: da_season_id)
      my_last_uts = UserThemeSeason.create(user_id: da_user_id, theme_id: da_theme_id, season_id: da_season_id, completion_rate: 0)
      Chapter.where(theme_id: da_theme_id).each do |da_chapter|
        my_last_uts_chapter = UserThemeSeasonChapter.create(user_theme_season_id: my_last_uts.id,chapter_id: da_chapter.id, completion_rate: 0)
          Course.where(chapter_id: da_chapter.id).each do |da_course|
            my_last_uts_course = UtscCourse.create(user_theme_season_chapter_id: my_last_uts_chapter.id, course_id: da_course.id, completed: false)
          end
      end
      flash[:success] = "Vous avez ajouté le thème avec succès"
    end
    redirect_to dashboard_index_path
  end

end
