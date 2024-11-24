namespace :podcasts do
  desc "Add a new podcast by URL"
  task :add, [ :url ] => :environment do |_, args|
    podcast = Podcast.create!(url: args[:url])
    PodcastFetcherJob.perform_later(podcast)
  end

  desc "Fetch all podcasts"
  task fetch: :environment do
    Podcast.all.each { |podcast| PodcastFetcherJob.perform_later(podcast) }
  end
end
