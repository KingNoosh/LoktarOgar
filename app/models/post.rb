class Post < ApplicationRecord
  belongs_to :topic_thread
  belongs_to :user
end
