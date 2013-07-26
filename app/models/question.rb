class Question < ActiveRecord::Base
  belongs_to :survey
  has_many :responses, dependent: :destroy

  validates :text, presence: true
end
