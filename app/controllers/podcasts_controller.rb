class PodcastsController < ApplicationController
  allow_unauthenticated_access

  def index
    @podcasts = Podcast.all
  end

  def show
    @podcast = Podcast.find(params.expect(:id))
  end
end
