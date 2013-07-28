class Response < ActiveRecord::Base
  belongs_to :question
  has_many :votes, dependent: :destroy
  delegate :survey, to: :question

  validates :text, presence: true

  def percent
    users_who_chose_response = self.votes.count
    users_who_participated = self.survey.participants.size
    return 0 if users_who_participated == 0
    percent = (users_who_chose_response / users_who_participated.to_f * 100).round
  end

end
