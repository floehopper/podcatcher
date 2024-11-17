class PodcastsController < ApplicationController
  def index
    @podcasts = Podcast.order(published_at: :desc)
  end

  def show
    @podcast = Podcast.find(params.expect(:id))
  end
end
