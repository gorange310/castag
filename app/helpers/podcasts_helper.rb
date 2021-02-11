module PodcastsHelper
  def show_audio_length(sec)
    Time.at(sec).utc.strftime("%H h :%M m")
  end
end
