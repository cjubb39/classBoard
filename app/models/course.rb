class Course
  include Mongoid::Document

	has_and_belongs_to_many	:users
	has_many	:assignments
	has_many	:lectures
	has_many	:uploads

  validates_uniqueness_of :CallNumber

  #added validates presence of CallNumber and CourseTitle
  validates_presence_of :CallNumber
  validates_presence_of :CourseTitle

  field :CallNumber,  type: Integer
  field :CourseTitle, type: String
  field :StartTime1,  type: String
  field :EndTime1,  type: String
  field :MeetsOn1,  type: String
  field :Building1, type: String
  field :Room1,   type: String
  field :Instructor1Name, type: String

end
