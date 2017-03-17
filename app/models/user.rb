class User < ActiveRecord::Base
  has_secure_password
  has_many :user_events
  has_many :events, through: :user_events

  def slug
    username.downcase.gsub(" ","-")
  end

  def self.find_by_slug(slug)
    self.all.find{|user| user.slug == slug}
  end

end