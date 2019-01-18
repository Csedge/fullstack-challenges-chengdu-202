class Post < ActiveRecord::Base
  belongs_to :user

  # TODO: Add some validation
  validates :user, presence: true
  validates :name, presence: true
  validates :url, presence: true
  # validates :url, format: URI::regexp(%w(http https))
  validates :url, format: { with: /\A(http|https)/ }
  validates :name, length: { minimum: 5 }
  validates :name, uniqueness: true
  validates :name, uniqueness: { case_sensitive: false }
  # Post.create(name: "John Doe").valid? # => true
end
