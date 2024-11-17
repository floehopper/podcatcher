class AddEnclosureUrlAndEnclosureTypeToEpisodes < ActiveRecord::Migration[8.0]
  def change
    add_column :episodes, :enclosure_url, :string
    add_column :episodes, :enclosure_type, :string
  end
end
