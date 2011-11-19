# == Schema Information
#
# Table name: goals
#
#  id         :integer(4)      not null, primary key
#  user_id    :integer(4)
#  title      :string(255)
#  note       :string(255)
#  created_at :datetime
#  updated_at :datetime
#  role_id    :integer(4)
#

class Goal < ActiveRecord::Base
  ## included modules & attr_*

  ## associations
  belongs_to :user
  belongs_to :role
  
  ## plugins

  ## callbacks

  ## validations

  ## named_scopes

  ## class methods
  public
  protected
  private
end
