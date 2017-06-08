class Instructor <ActiveRecord::Base
  has_many :classes
  has_many :students, :through => :classes
  has_secure_password

  def slug
    username.downcase.gsub(" ","-")
  end

  def self.find_by_slug(slug)
    User.all.find{|u| u.slug == slug}
  end

end
