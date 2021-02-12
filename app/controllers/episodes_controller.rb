class EpisodesController < ApplicationController
  def search
    keyword = params[:keyword]
    @episodes = Episode.search(keyword).page(params[:page]).per(5)
  end
end
