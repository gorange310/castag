class CreateEpisodes < ActiveRecord::Migration[6.1]
  def change
    create_table :episodes do |t|
      t.string :title
      t.text :note
      t.datetime :published_at
      t.integer :minutes
      t.belongs_to :podcast, null: false, foreign_key: true

      t.timestamps
    end
  end
end
