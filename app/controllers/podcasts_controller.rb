class PodcastsController < ApplicationController
  def index
    @podcasts = Podcast.page(params[:page]).per(10)
  end

  def show
    @podcast = Podcast.find(params[:id])
    @episodes = @podcast.episodes.order(id: :desc)
  end
end
