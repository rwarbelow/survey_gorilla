class Response < ActiveRecord::Base
  belongs_to :question
  has_many :votes, dependent: :destroy
  delegate :survey, to: :question

  validates :text, presence: true
end
