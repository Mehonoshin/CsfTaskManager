# == Schema Information
#
# Table name: roles
#
#  id          :integer(4)      not null, primary key
#  user_id     :integer(4)
#  name        :string(255)
#  description :text
#  created_at  :datetime
#  updated_at  :datetime
#

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
