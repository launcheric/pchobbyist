class MemoryCard < ApplicationRecord
  has_many :memory_counts
  has_many :builds, through: :memory_counts

  validates_presence_of :name, :manufacturer, :memory_type
  validates_presence_of :speed, :size, :cas_latency
  validates_presence_of :voltage, :ecc, :registered
end
