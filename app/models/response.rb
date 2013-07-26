class Response < ActiveRecord::Base
  belongs_to :question
  has_many :votes, dependent: :destroy

  validates :text, presence: true

  def self.create_from_params(string, question_id)
    string.split(/,\w?/).each do |response|
      Response.create(text: response, question_id: question_id)
    end
  end
end
