class CreateEpisodes < ActiveRecord::Migration[8.0]
  def change
    create_table :episodes do |t|
      t.string :guid, null: false
      t.string :title
      t.references :podcast, null: false, foreign_key: true

      t.timestamps
    end
  end
end
