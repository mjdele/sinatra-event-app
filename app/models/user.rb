class User < ActiveRecord::Base
  has_many :user_events
  has_many :events, through: :user_events

  has_secure_password

  validates :username, presence: true
  validates :username, uniqueness: true

  def slug
    username.downcase.gsub(" ","-")
  end

  def self.find_by_slug(slug)
    self.all.find{|user| user.slug == slug}
  end

end