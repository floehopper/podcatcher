require "open-uri"

class Podcast < ApplicationRecord
  has_many :episodes, dependent: :destroy

  validates :url, presence: true, uniqueness: true

  def fetch
    xml = URI.open(url).read
    feed = Feedjira.parse(xml)
    update!(
      title: feed.title,
      published_at: feed.published || feed.last_built
    )

    feed.entries.each do |entry|
      episode = episodes.find_or_create_by!(guid: entry.id)
      episode.update!(
        title: entry.title,
        published_at: entry.published
      )
    end
  end
end
