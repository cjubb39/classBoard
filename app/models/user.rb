class User
  include Mongoid::Document
  include ActiveModel::SecurePassword

  has_secure_password

  #attr_accessible :email, :password, :password_confirmation

  validates_uniqueness_of :email
  validates_presence_of :first_name, :last_name

	has_and_belongs_to_many	:courses
	has_many	:uploads

  field :first_name, type: String
  field :last_name, type: String
  field :email, type: String
  field :password_digest, type: String
end
