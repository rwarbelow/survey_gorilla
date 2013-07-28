class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :response
  delegate :question, to: :response
  delegate :survey, to: :response
end
