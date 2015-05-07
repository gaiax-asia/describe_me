class User < ActiveRecord::Base
  has_many :descriptions, class_name: 'Description', foreign_key: 'described_user_id'
  has_many :given_descriptions, class_name: 'Description', foreign_key: 'described_by_user_id'
end
