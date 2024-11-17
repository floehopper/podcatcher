class AddTitleToPodcasts < ActiveRecord::Migration[8.0]
  def change
    add_column :podcasts, :title, :string
  end
end
