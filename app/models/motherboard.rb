class Motherboard < ApplicationRecord
  has_many :builds
  
  validates_presence_of :name, :manufacturer, :form_factor
  validates_presence_of :socket, :chipset, :memory_pin, :memory_slots
  validates_presence_of :memory_type, :maximum_memory, :raid_support
end
