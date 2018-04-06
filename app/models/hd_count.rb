class HdCount < ApplicationRecord
  belongs_to :build
  belongs_to :hard_drive
end
