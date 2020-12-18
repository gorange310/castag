class Episode < ApplicationRecord
  belongs_to :podcast
  # 
  # validates :title, presence: true
  # validates :note, presence: true
  # validates :published_at, presence: true
  # validates :minutes, presence: true

end
