class PagesController < ApplicationController
  def home
    if authenticated?
      redirect_to subscriptions_path
    else
      redirect_to podcasts_path
    end
  end
end
