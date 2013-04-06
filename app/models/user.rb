class User
  include Mongoid::Document

	has_and_belongs_to_many	:courses
	has_many	:uploads

  field :first_name, type: String
  field :last_name, type: String
  field :email, type: String
end
