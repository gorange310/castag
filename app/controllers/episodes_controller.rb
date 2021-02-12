class EpisodesController < ApplicationController
  def index
    @episodes = Episode.page(params[:page]).per(5).order(published_at: :desc)
  end

  def search
    keyword = params[:keyword]
    @episodes = Episode.search(keyword).page(params[:page]).per(5).order(published_at: :desc)
  end
end
