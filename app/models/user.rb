class User < ApplicationRecord
	attr_writer :login

	def login
		@login || self.username || self.email
	end

	def self.find_for_database_authentication warden_conditions
		conditions = warden_conditions.dup
		if login = conditions.delete(:login)
			where(conditions.to_h).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase}]).first
		elsif conditions.has_key?(:username) || conditions.has_key?(:email)
			conditions[:email].downcase! if conditions[:email]
			where(conditions.to_h).first
		end
	end

  def self.current
    Thread.current[:user]
  end
  def self.current=(user)
    Thread.current[:user] = user
  end

	validates :username, presence: :true, uniqueness: { case_sensitive: false }
	validates_format_of :username, with: /^[a-zA-Z0-9_\.]*$/, :multiline => true
	has_many :favorites
	has_many :favorite_resources, through: :favorites, source: :favorited, source_type: 'Resource'
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
end
