class User
  include Mongoid::Document
  include Mongoid::Slug
  include ActiveModel::SecurePassword

  has_secure_password

  attr_accessible :first_name, :last_name, :email, :password, :password_confirmation

  validates_uniqueness_of :email, :message => "please provide valid email not already used"
  validates_presence_of :first_name, :last_name, :message => "please provide name"

	has_and_belongs_to_many	:courses
	has_many	:uploads

  field :first_name, type: String
  field :last_name, type: String
  field :email, type: String
  field :password_digest, type: String
  field :role,  type: String

  slug  :email, history: false
end