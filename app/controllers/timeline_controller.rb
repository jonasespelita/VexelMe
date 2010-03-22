class TimelineController < ApplicationController
  before_filter   :login_required, :twitter_login_required
  def index
    @tweets = current_user.twitter.get('/statuses/friends_timeline')  
  end

end
