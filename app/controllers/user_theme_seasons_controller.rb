class UserThemeSeasonsController < ApplicationController

  def create
    puts "*********** the_user: #{params[:the_user]} *********** the_theme: #{params[:the_theme]} ***********"
    # Shortly this method should be able to subscribe a USER to the latest SEASON of a given THEME by:
    # 1) Getting the last SEASON of the considered THEME (If not done before, to be verified if such a SEASON exists)
    # 2) Creating the adequate USER_SEASON object (cf. data model)
    # 3) Creating an UTS object with the related USER, the considered THEME and the collected SEASON
    # 4) Cascading the process by creating all related UTS_CHAPTERS (based on CHAPTERS of the considered THEME) with "completion_rate" valued to 0
    # 5) Doing the same with UTSC_COURSES (based on the COURSES of the considered CHAPTER) with their "completion_rate" valued to "false"
    # 6) That's pretty it... Easy ;-)
  end

end
