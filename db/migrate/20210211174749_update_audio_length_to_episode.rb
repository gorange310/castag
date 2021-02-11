class UpdateAudioLengthToEpisode < ActiveRecord::Migration[6.1]
  def change
    rename_column :episodes, :minutes, :audio_length_sec
  end
end