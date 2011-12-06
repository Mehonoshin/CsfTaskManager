# == Schema Information
#
# Table name: exclusions
#
#  id         :integer(4)      not null, primary key
#  goal_id    :integer(4)
#  date       :datetime
#  created_at :datetime
#  updated_at :datetime
#

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
