class PagesController < ApplicationController
  def home
    redirect_to podcasts_path
  end
end
