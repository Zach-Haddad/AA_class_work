class Course < ActiveRecord::Base
  has_many :enrollments,
  foreign_key: :course_id,
  class_name: :Enrollment,
  primary_key: :id

  has_many :enrolled_students,
    through: :enrollments,
    source: :user

  belongs_to :prerequisite,
    class_name: :Course,
    foreign_key: :prereq_id,
    primary_key: :id

  has_many :advanced_courses,
    class_name: :Course,
    foreign_key: :prereq_id,
    primary_key: :id

  belongs_to :instructor,
    foreign_key: :instructor_id,
    class_name: :User,
    primary_key: :id
end
