class PowerSupply < ApplicationRecord
  has_many :builds
  
  validates_presence_of :name, :manufacturer, :psu_type
  validates_presence_of :wattage, :modular, :efficiency_certification
end
