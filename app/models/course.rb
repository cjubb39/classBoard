class Course
  include Mongoid::Document

	has_and_belongs_to_many	:users
	has_many	:assignments
	has_many	:lectures
	has_many	:uploads

  field :title, type: String
  field :course_code, type: String
  field :description, type: String
end
