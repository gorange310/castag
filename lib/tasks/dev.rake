namespace :dev do
  task :fetch_podcast => :environment do
    (1..25).each do |page|
      puts "Fetch podcasts data..."
      response = Unirest.get "https://listen-api.listennotes.com/api/v2/best_podcasts?region=tw&page=#{page}",
        headers:{
          "X-ListenAPI-Key" => LISTEN_CONFIG[:api_key],
        }
      data = response.body
      data["podcasts"].each do |podcast|
        existing_podcast = Podcast.find_by_listen_id( podcast["id"] )
        if existing_podcast.nil?
          Podcast.create!(
            :listen_id => podcast["id"],
            :title => podcast["title"],
            :host => podcast["publisher"],
            :cover => podcast["image"],
            :description => podcast["description"])
        end
      end
    puts "Total: #{Podcast.count} podcasts... page: #{page}"
    end
  end

  task :fetch_episode => :environment do
    Podcast.all.each do |podcast|
      puts "Fetch episodes data..."
        response = Unirest.get "https://listen-api.listennotes.com/api/v2/podcasts/#{podcast.listen_id}?next_episode_pub_date=#{podcast.episodes.last.published_at}",
        # params: { :next_episode_pub_date => podcast.episodes.last.published_at,
                      # "X-ListenAPI-Key" => LISTEN_CONFIG[:api_key], }  
        # params: { "next_episode_pub_date" => podcast.episodes.last.published_at, },
          headers:{
            "X-ListenAPI-Key" => LISTEN_CONFIG[:api_key],
          }
        data = response.body
        data["episodes"].each do |episode|
          existing_episode = Episode.find_by_listen_ep_id( episode["id"] )
          if existing_episode.nil?
            Episode.create!(
              :listen_ep_id => episode["id"],
              :title => episode["title"],
              :note => episode["description"],
              :published_at => episode["pub_date_ms"],
              :audio_length_sec => episode["audio_length_sec"],
              :podcast_id => podcast.id)
          else
            existing_episode.update!(:published_at => episode["pub_date_ms"])
          end
        end
      puts "Total: #{podcast.episodes.count} episodes... show: #{podcast.title}"
    end
  end
end


