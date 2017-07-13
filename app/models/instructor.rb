class Instructor <ActiveRecord::Base

  has_many :courses
  has_many :students, :through => :courses
  extend Slugifiable::ClassMethods
  include Slugifiable::InstanceMethods


  # def slug
  #   name.downcase.gsub(" ","-")
  # end

  # def self.find_by_slug(slug)
  #   Instructor.all.find{|u| u.slug == slug}
  # end

end
