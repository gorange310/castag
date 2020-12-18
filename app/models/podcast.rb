class Podcast < ApplicationRecord
  validates :title, presence: true
  validates :host, presence: true
  validates :description, presence: true
end
