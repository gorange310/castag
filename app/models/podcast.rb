class Podcast < ApplicationRecord
  validates :listen_id, presence: true
  validates :title, presence: true
  validates :host, presence: true
  validates :cover, presence: true

  has_many :episodes
end
