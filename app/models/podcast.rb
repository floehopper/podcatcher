class Podcast < ApplicationRecord
  validates :url, presence: true, uniqueness: true
end
