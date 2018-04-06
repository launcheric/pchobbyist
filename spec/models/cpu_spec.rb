require 'rails_helper'

RSpec.describe Cpu, type: :model do
  it { should have_valid(:name).when('Intel - Core i7-8700K 3.7GHz 6-Core Processor') }
  it { should_not have_valid(:name).when(nil, '') }

  it { should have_valid(:manufacturer).when('Intel') }
  it { should_not have_valid(:manufacturer).when(nil, '') }

  it { should have_valid(:data_width).when('64') }

  it { should have_valid(:socket).when('LGA1151') }
  it { should_not have_valid(:socket).when(nil, '') }

  it { should have_valid(:operating_frequency).when('3.7GHz') }
  it { should_not have_valid(:operating_frequency).when(nil, '') }

  it { should have_valid(:max_turbo_frequency).when('4.7GHz') }
  it { should_not have_valid(:max_turbo_frequency).when(nil, '') }

  it { should have_valid(:cores).when('6') }
  it { should_not have_valid(:cores).when(nil, '') }

  it { should have_valid(:lighography).when('14 nm') }
  it { should_not have_valid(:lighography).when(nil, '') }

  it { should have_valid(:thermal_design_power).when('95 Watts') }
  it { should_not have_valid(:thermal_design_power).when(nil, '') }

  it { should have_valid(:cooler).when('No') }
  it { should_not have_valid(:cooler).when(nil, '') }

  it { should have_valid(:maximum_memory).when('64') }
  it { should_not have_valid(:maximum_memory).when(nil, '') }

  it { should have_valid(:integrated_graphics).when('Intel UHD Graphics 630') }
  it { should_not have_valid(:integrated_graphics).when(nil, '') }
end
