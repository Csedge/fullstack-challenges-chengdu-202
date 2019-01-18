class User < ActiveRecord::Base
  has_many :posts

  validates :username, presence: true
  validates :email, presence: true
  validates :email, format: /@/
  validates :username, uniqueness: true
  before_validation :strip_email
  after_validation :email_welcome

  def strip_email
    self.email = email.strip unless email.nil?
  end

  def email_welcome
    FakeMailer.instance.mail('boris@lewagon.org', 'Welcome to HN!')
  end
end
