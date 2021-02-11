class AddListenIdToPodcast < ActiveRecord::Migration[6.1]
  def change
    add_column :podcasts, :listen_id, :string
    add_index :podcasts, :listen_id
  end
end
