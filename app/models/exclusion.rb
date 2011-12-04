class Exclusion < ActiveRecord::Base
  ## included modules & attr_*
  
  ## associations
  belongs_to :goal
  
  ## plugins

  ## callbacks

  ## validations
  validates :date, :presence => true

  ## named_scopes

  ## class methods
  public
  protected
  private
end
