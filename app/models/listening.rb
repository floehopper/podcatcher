class Listening < ApplicationRecord
  belongs_to :user
  belongs_to :episode

  validates :episode_id, uniqueness: { scope: :user_id }
end
