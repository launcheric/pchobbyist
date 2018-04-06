require 'rails_helper'

RSpec.describe ComputerCase, type: :model do
  it { should have_valid(:name).when('NZXT - S340') }
  it { should_not have_valid(:name).when(nil, '') }

  it { should have_valid(:manufacturer).when('NZXT') }
  it { should_not have_valid(:manufacturer).when(nil, '') }

  it { should have_valid(:case_type).when('ATX Mid Tower') }
  it { should_not have_valid(:case_type).when(nil, '') }

  it { should have_valid(:power_supply).when('No') }
  it { should_not have_valid(:power_supply).when(nil, '') }

  it { should have_valid(:small_bay).when('2') }
  it { should_not have_valid(:small_bay).when(nil, '') }

  it { should have_valid(:medium_bay).when('3') }
  it { should_not have_valid(:medium_bay).when(nil, '') }

  it { should have_valid(:compatibility).when('ATX, Micro ATX, Mini ITX') }
  it { should_not have_valid(:compatibility).when(nil, '') }
end
