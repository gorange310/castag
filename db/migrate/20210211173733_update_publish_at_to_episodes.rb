class UpdatePublishAtToEpisodes < ActiveRecord::Migration[6.1]
  def change
    change_column :episodes, :published_at, :integer
  end
end
