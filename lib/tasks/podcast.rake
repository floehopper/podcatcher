namespace :podcasts do
  desc "Add a new podcast by URL"
  task :add, [:url] => :environment do |_, args|
    Podcast.create!(url: args[:url])
  end
end
