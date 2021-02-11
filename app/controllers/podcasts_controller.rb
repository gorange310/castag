class PodcastsController < ApplicationController
  def index
    @podcasts = Podcast.page(params[:page]).per(10)
  end

  def show
    @podcast = Podcast.find(params[:id])
    @episodes = @podcast.episodes.page(params[:page]).per(5)
  end
end
