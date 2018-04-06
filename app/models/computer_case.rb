class ComputerCase < ApplicationRecord
  has_many :builds

  validates_presence_of :name, :manufacturer, :compatibility, :case_type
  validates_presence_of :power_supply, :small_bay, :medium_bay
end
