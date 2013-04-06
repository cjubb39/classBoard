class Upload
  include Mongoid::Document

	belongs_to	:assignment
	belongs_to	:user
	belongs_to	:course

  field :name, type: String
  field :upload_date, type: Date
end
