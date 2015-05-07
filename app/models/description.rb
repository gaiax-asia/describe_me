class Description < ActiveRecord::Base
  belongs_to :described, class_name: 'User', foreign_key: 'described_user_id'
  belongs_to :describer, class_name: 'User', foreign_key: 'described_by_user_id'

  def described
    User.find_by_fb_id(self.described_user_id)
  end

  def describer
    User.find_by_fb_id(self.described_by_user_id)
  end
end
