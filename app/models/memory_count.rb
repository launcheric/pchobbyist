class MemoryCount < ApplicationRecord
  belongs_to :build
  belongs_to :memory_card

  validates_presence_of :build_id, :memory_card_id
end
