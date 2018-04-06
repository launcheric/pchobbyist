require 'rails_helper'

RSpec.describe Build, type: :model do
  it { should have_valid(:name).when('My First Build') }
  it { should_not have_valid(:name).when(nil, '') }

  it { should have_valid(:description).when('This is super cool!') }

  it { should have_valid(:computer_case_id).when('1') }
  it { should_not have_valid(:computer_case_id).when(nil, '') }

  it { should have_valid(:cpu_cooler_id).when('') }

  it { should have_valid(:cpu_id).when('2') }
  it { should_not have_valid(:cpu_id).when(nil, '') }

  it { should have_valid(:motherboard_id).when('3') }
  it { should_not have_valid(:motherboard_id).when(nil, '') }

  it { should have_valid(:network_card_id).when('') }

  it { should have_valid(:power_supply_id).when('2') }
  it { should_not have_valid(:power_supply_id).when(nil, '') }

  it { should have_valid(:video_card_id).when('') }
end
