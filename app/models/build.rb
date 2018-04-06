class Build < ApplicationRecord
  has_many :memory_counts
  has_many :memory_cards, through: :memory_counts
  has_many :hd_counts
  has_many :hard_drives, through: :hd_counts, source: :hard_drive
  has_many :comments
  belongs_to :computer_case
  belongs_to :cpu
  belongs_to :motherboard
  belongs_to :power_supply
  belongs_to :cpu_cooler, optional: true
  belongs_to :network_card, optional: true
  belongs_to :video_card, optional: true
  belongs_to :user

  mount_uploader :image_url, ImageUploader

  validates_presence_of :name, :computer_case_id, :cpu_id
  validates_presence_of :motherboard_id, :power_supply_id, :user_id
end
