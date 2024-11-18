require "open-uri"

class Episode < ApplicationRecord
  belongs_to :podcast
  has_many :listenings, dependent: :destroy

  has_one_attached :audio

  default_scope { order(published_at: :desc) }

  validates :guid, presence: true, uniqueness: true

  def fetch
    return if audio.attached?

    URI.open(enclosure_url, "User-Agent" => "curl/8.7.1") do |io|
      audio.attach(
        io: io,
        filename: filename,
        content_type: enclosure_type
      )
    end
  rescue OpenURI::HTTPError => e
    raise "Failed to fetch #{enclosure_url}: #{e.message}"
  end

  private

  def filename
    filename = "#{podcast.title.parameterize}_#{title.parameterize}"
    mime_type = Mime::Type.lookup(enclosure_type)
    extension = mime_type.symbol.to_s
    filename.ext(extension)
  end
end
