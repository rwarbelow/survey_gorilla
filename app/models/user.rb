class User < ActiveRecord::Base
  has_many :surveys
  has_many :votes, foreign_key: "user_email", primary_key: "email"

  attr_accessor :password, :password_confirmation

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true , uniqueness: true , format: {with: /^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}$/}
  validates :password, presence: true
  validates_confirmation_of :password
  before_save :hash_password

  def hash_password
    self.password_hash = BCrypt::Password.create(self.password)
  end

  def self.authenticate(email, password)
    user = User.find_by_email(email)
    if user && BCrypt::Password.new(user.password_hash) == password
      user
    else
      nil
    end
  end
end
