class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  #Relaciones
  has_many :offers
  has_many :favors
  has_many :comments
  has_many :buys
  has_many :pays

  after_create :assign_default_role

  def assign_default_role
    add_role(:usuario) if self.roles.blank?
  end

  scope :by_email, -> email { where(email: email) }
  validates_presence_of :first_name, :last_name, :secret_question, :age
  validates_inclusion_of :age, in: 18..99


end
