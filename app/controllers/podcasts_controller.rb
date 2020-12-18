class PodcastsController < ApplicationController
  def index
    @podcasts = Podcast.all
  end

  def show
    @podcast = Podcast.find(params[:id])
    @episodes = @podcast.episodes.order(id: :desc)
  end
end
