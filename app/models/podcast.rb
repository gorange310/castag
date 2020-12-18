class Podcast < ApplicationRecord
  validates :title, presence: true
  validates :host, presence: true
  validates :cover, presence: true
  validates :description, presence: true

  has_many :episodes
end
