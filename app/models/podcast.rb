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

    feed.entries.sort_by(&:published).reverse.first(10).each do |entry|
      episode = episodes.find_or_create_by!(guid: entry.id)
      episode.update!(
        title: entry.title,
        enclosure_url: entry.enclosure_url,
        enclosure_type: entry.enclosure_type,
        published_at: entry.published
      )
      episode.fetch
    end
  end
end
