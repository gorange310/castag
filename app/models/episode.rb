class Episode < ApplicationRecord
  belongs_to :podcast
  
  validates :title, presence: true
  validates :published_at, presence: true
  validates :audio_length_sec, presence: true

  def show_published_at
    date = Date.strptime((self.published_at/1000).to_s, '%s')
    if Date.today - date < 7 then date.strftime('%A') else date end
  end

  def show_audio_length
    time = Time.at(self.audio_length_sec).utc
    time.strftime("%Hh: %Mm: %Ss")
    unless self.audio_length_sec > 3600 then time.strftime("%Mm: %Ss") end
  end

  def self.search(keyword)
    where("title like '%#{keyword}%' or note like '%#{keyword}%'")
  end

end
