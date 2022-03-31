class UserThemeSeasonsController < ApplicationController

  def create
    puts "DEBUG - Entering UserThemeSeasonsController#create to subscribe"
    puts "  > the_user: #{params[:the_user]}"
    puts "  > the_theme: #{params[:the_theme]}"
    puts "  > the_season: #{params[:the_season]}"
    da_user_id = params[:the_user]
    da_theme_id = params[:the_theme]
    da_season_id = params[:the_season]
    # Shortly this method should be able to subscribe a USER to the latest SEASON of a given THEME by:
    # 1) Creating the adequate USER_SEASON object (cf. data model)
    my_last_user_season = UserSeason.create(user_id: da_user_id, season_id: da_season_id)
    # 2) Creating an UTS object (cf. data model) with the related USER, the considered THEME and the collected SEASON
    my_last_uts = UserThemeSeason.create(user_id: da_user_id, theme_id: da_theme_id, season_id: da_season_id, completion_rate: 0)
    # 3) Cascading the process by creating all related UTS_CHAPTERS (based on CHAPTERS of the considered THEME) with "completion_rate" valued to 0
    # 4) Doing the same with UTSC_COURSES (based on the COURSES of the considered CHAPTER) with their "completion_rate" valued to "false"
    Chapter.where(theme_id: da_theme_id).each do |da_chapter|
      my_last_uts_chapter = UserThemeSeasonChapter.create(user_theme_season_id: my_last_uts.id,chapter_id: da_chapter.id, completion_rate: 0)
      Course.where(chapter_id: da_chapter.id).each do |da_course|
        my_last_uts_course = UtscCourse.create(user_theme_season_chapter_id: my_last_uts_chapter.id, course_id: da_course.id, completed: false)
      end
    end
    # 5) That's pretty it... Easy ;-)

    redirect_to dashboard_index_path

  end

end
