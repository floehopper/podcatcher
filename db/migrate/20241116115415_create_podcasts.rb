class CreatePodcasts < ActiveRecord::Migration[8.0]
  def change
    create_table :podcasts do |t|
      t.string :url, null: false
      t.index :url, unique: true

      t.timestamps
    end
  end
end
