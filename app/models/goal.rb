# == Schema Information
#
# Table name: goals
#
#  id              :integer(4)      not null, primary key
#  user_id         :integer(4)
#  title           :string(255)
#  note            :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#  role_id         :integer(4)
#  date            :datetime
#  repeat_schedule :string(255)
#  weekday         :integer(4)
#

class Goal < ActiveRecord::Base
  ## included modules & attr_*
  
  ## associations
  belongs_to :user
  belongs_to :role
  
  ## plugins

  ## callbacks
  before_save :set_weekday

  ## validations

  ## named_scopes
  scope :this_week, lambda { |week_start, week_end| where("(date >= ? AND date <= ?) OR repeat_schedule = ? ", week_start, week_end, 'weekly') }
  scope :this_day, lambda { |day| where("date >= ? AND date <= ?", day.beginning_of_day, day.end_of_day) }
  scope :this_month, lambda { |day| where("date >= ? AND date <= ?", day.beginning_of_month, day.end_of_month) }

  ## class methods
  public
  protected
  private
  
  def set_weekday
    self.weekday = date.wday
  end
end
