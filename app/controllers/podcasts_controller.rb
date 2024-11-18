class PodcastsController < ApplicationController
  allow_unauthenticated_access

  def index
    @podcasts = Podcast.order(published_at: :desc)
  end

  def show
    @podcast = Podcast.find(params.expect(:id))
  end
end
