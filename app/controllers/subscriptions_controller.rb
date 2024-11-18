class SubscriptionsController < ApplicationController
  def index
    redirect_to podcasts_path if Current.user.subscriptions.empty?
    @subscriptions = Current.user.subscriptions
  end

  def create
    podcast = Podcast.find(params.expect(:podcast_id))
    Current.user.subscriptions.find_or_create_by!(podcast: podcast)
    redirect_back_or_to podcasts_path, notice: "Subscribed!"
  end

  def destroy
    subscription = Current.user.subscriptions.find(params.expect(:id))
    subscription.destroy!
    redirect_back_or_to podcasts_path, notice: "Unsubscribed!"
  end
end
