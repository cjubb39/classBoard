class Lecture
  include Mongoid::Document

	belongs_to	:course

  field :title, type: String
  field :description, type: String
  field :date, type: Date
end
