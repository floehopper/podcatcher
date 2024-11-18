class EpisodesController < ApplicationController
  allow_unauthenticated_access

  def show
    @episode = Episode.find(params.expect(:id))
  end
end
