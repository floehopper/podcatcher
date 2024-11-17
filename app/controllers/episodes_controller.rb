class EpisodesController < ApplicationController
  def show
    @episode = Episode.find(params.expect(:id))
  end
end
