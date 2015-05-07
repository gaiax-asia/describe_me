class User < ActiveRecord::Base
  has_many :descriptions, class_name: 'Description', foreign_key: 'described_user_id'
  has_many :given_descriptions, class_name: 'Description', foreign_key: 'described_by_user_id'


  def facebook_details
    facebook = Koala::Facebook::API.new(self.oauth_token, '16f69b54145dcc55488d4a8963a0c030')
  end

  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.first_name = auth.extra.raw_info.first_name
      user.last_name = auth.extra.raw_info.last_name
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save!
    end
  end
end
