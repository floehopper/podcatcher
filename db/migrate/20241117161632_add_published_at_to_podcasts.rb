class AddPublishedAtToPodcasts < ActiveRecord::Migration[8.0]
  def change
    add_column :podcasts, :published_at, :datetime
  end
end
