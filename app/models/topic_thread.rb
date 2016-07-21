class TopicThread < ApplicationRecord
    belongs_to :topic
    belongs_to :user
    has_many :posts, dependent: :destroy
end
