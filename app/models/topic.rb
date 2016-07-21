class Topic < ApplicationRecord
  has_many :topic_threads, dependent: :destroy
end
