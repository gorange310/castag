class CreatePodcasts < ActiveRecord::Migration[6.1]
  def change
    create_table :podcasts do |t|
      t.string :title
      t.string :host
      t.string :cover
      t.text :description

      t.timestamps
    end
  end
end
