class Description < ActiveRecord::Base
  belongs_to :described, class_name: 'User', foreign_key: 'described_user_id'
  belongs_to :describer, class_name: 'User', foreign_key: 'described_by_user_id'
end
