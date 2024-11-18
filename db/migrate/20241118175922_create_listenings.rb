class CreateListenings < ActiveRecord::Migration[8.0]
  def change
    create_table :listenings do |t|
      t.references :user, null: false, foreign_key: true
      t.references :episode, null: false, foreign_key: true
      t.float :position

      t.index [ :user_id, :episode_id ], unique: true

      t.timestamps
    end
  end
end
