class Student <ActiveRecord::Base
  has_many :course_students
  has_many :courses, :through => :course_students
  has_many :instructors, :through => :courses
  has_secure_password
  extend Slugifiable::ClassMethods
  include Slugifiable::InstanceMethods

  # def slug
  #   name.downcase.gsub(" ","-")
  # end

  # def self.find_by_slug(slug)
  #   Student.all.find{|u| u.slug == slug}
  # end

end
