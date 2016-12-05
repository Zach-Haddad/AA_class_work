class User < ActiveRecord::Base
  has_many :enrollments,
    foreign_key: :student_id,
    class_name: :Enrollment,
    primary_key: :id

  has_many :enrolled_courses,
    through: :enrollments,
    source: :course
end
