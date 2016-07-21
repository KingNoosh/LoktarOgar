class User < ApplicationRecord
  def from_omniauth(auth_hash)
    user = find_or_create_by(id: auth_hash['uid'])
    user.battletag = auth_hash['info']['name']
    user.save!
    # We're not going to tell them this is an oauth2 token, let's be honest
    session[:token] = auth_hash['credentials']['token']
    user
  end
  # We should keep threads but set author to 0, 0 should show as [DELETED]
  has_many :topic_threads, dependent: :destroy
  has_many :posts, dependent: :destroy
end
