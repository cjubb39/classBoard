class Assignment
  include Mongoid::Document

	has_many	:uploads

	belongs_to	:course

  field :title, type: String
  field :instructions, type: String
  field :due_date, type: Date
  field :grade, type: String
  field :modified, type: Date
end
