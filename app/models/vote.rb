class Vote < ActiveRecord::Base
  belongs_to :user, primary_key: 'email', foreign_key: 'user_email'
  belongs_to :response
  delegate :question, to: :response
  has_one :survey, through: :response
  validates_uniqueness_of :user_email, :scope => :response_id
end
