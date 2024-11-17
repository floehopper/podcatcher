require "open-uri"

class Podcast < ApplicationRecord
  validates :url, presence: true, uniqueness: true

  def fetch
    xml = URI.open(url).read
    feed = Feedjira.parse(xml)
    update!(
      title: feed.title
    )
  end
end
