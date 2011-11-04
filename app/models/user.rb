class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  ## included modules & attr_*

  ## associations
  has_many :goals
  has_many :roles

  ## plugins

  ## callbacks

  ## validations

  ## named_scopes

  ## class methods
  public
  protected
  private
end
