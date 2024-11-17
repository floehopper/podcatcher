namespace :podcasts do
  desc "Add a new podcast by URL"
  task :add, [ :url ] => :environment do |_, args|
    Podcast.create!(url: args[:url])
  end

  desc "Fetch all podcasts"
  task fetch: :environment do
    Podcast.find_each(&:fetch)
  end
end
