class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :response
  delegate :question, to: :response
  delegate :survey, to: :response
  validates_uniqueness_of :user_email, :scope => :response_id
end
