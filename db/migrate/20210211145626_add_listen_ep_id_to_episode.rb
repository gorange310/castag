class AddListenEpIdToEpisode < ActiveRecord::Migration[6.1]
  def change
    add_column :episodes, :listen_ep_id, :string
    add_index :episodes, :listen_ep_id
  end
end
