class EpisodesController < ApplicationController
  def load_position
    episode = Episode.find(params.expect(:id))
    listening = Current.user.listenings.find_or_create_by!(episode: episode)
    render json: { position: listening.position }
  end

  def save_position
    episode = Episode.find(params.expect(:id))
    listening = Current.user.listenings.find_or_initialize_by(episode: episode)
    listening.update!(position: params.expect(:position))
    render json: {}
  end
end
