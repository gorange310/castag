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
end


