class Survey < ActiveRecord::Base
  belongs_to :creator, class_name: "User"
  has_many :questions, dependent: :destroy
  has_many :responses, through: :questions
  has_many :votes, through: :responses

  validates :title, presence: true
  
  def participants
    self.votes.map(&:user_email).uniq
  end

  def add_count
    self.participant_count += 1
    self.save
  end

end
