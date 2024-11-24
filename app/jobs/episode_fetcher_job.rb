class EpisodeFetcherJob < ApplicationJob
  def perform(episode)
    episode.fetch
  end
end
