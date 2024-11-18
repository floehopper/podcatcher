class CreateSubscriptions < ActiveRecord::Migration[8.0]
  def change
    create_table :subscriptions do |t|
      t.references :user, null: false, foreign_key: true
      t.references :podcast, null: false, foreign_key: true
      t.index %i[user_id podcast_id], unique: true

      t.timestamps
    end
  end
end
