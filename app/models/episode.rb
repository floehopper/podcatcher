class Episode < ApplicationRecord
  belongs_to :podcast

  validates :guid, presence: true, uniqueness: true
end
