class PodcastFetcherJob < ApplicationJob
  def perform(podcast)
    podcast.fetch
  end
end
