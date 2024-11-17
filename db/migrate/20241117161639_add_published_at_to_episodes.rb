class AddPublishedAtToEpisodes < ActiveRecord::Migration[8.0]
  def change
    add_column :episodes, :published_at, :datetime
  end
end
