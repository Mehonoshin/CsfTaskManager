class Role < ActiveRecord::Base
  ## included modules & attr_*

  ## associations
  belongs_to :user  
  has_many :goals
  
  ## plugins

  ## callbacks

  ## validations

  ## named_scopes

  ## class methods
  public
  protected
  private
  
end
