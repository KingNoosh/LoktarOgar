class User < ApplicationRecord
  # We should keep threads but set author to 0, 0 should show as [DELETED]
  has_many :topic_threads, dependent: :destroy
  has_many :posts, dependent: :destroy
end
