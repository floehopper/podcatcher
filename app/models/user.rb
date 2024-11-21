class User < ApplicationRecord
  has_secure_password
  has_many :sessions, dependent: :destroy
  has_many :subscriptions, dependent: :destroy
  has_many :podcasts, through: :subscriptions
  has_many :listenings, dependent: :destroy
  has_many :episodes, through: :podcasts

  normalizes :email_address, with: ->(e) { e.strip.downcase }

  def subscribed_to?(podcast)
    subscriptions.exists?(podcast: podcast)
  end

  def subscription_for(podcast)
    subscriptions.find_by(podcast: podcast)
  end
end
