class CreateTopicThreads < ActiveRecord::Migration[5.0]
  def change
    create_table :topic_threads do |t|
      t.belongs_to :topic, foreign_key: true
      t.belongs_to :user, foreign_key: true
      t.string :title

      t.timestamps
    end
  end
end
