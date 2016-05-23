class HomeController < ApplicationController
  before_action :authenticate_user!
  require 'csv'
  def index
    @tweet = Tweet.new
    @tweets = current_user.all_tweets
    respond_to do |format|
      format.html
      format.csv do
        filename = "Tweets-#{Date.today}"
        response.headers['Content-Disposition'] = 'attachment; filename="' + filename + '.csv"'
        results = CSV.generate do |csv|
          csv << ['User Name','Tweet', 'Created At'] # Header values of CSV
          @tweets.each do |tweet|
            csv << [tweet.user.name, tweet.tweet.body, tweet.created_at] # Row values of CSV
          end
        end
        render text: results
      end
    end
  end

  def search
    q = params[:q]
    if !q.blank?
      @q = User.search(name_or_email_cont: q)
      @users= @q.result(:distinct => true)
    else
      flash[:notice] = "Enter User Name"
      redirect_to root_path
    end
  end
end