require 'rails_helper'

RSpec.describe HardDrive, type: :model do
  it { should have_valid(:name).when('Western Digital - Caviar Blue 1TB 3.5" 7200RPM Internal Hard Drive') }
  it { should_not have_valid(:name).when(nil, '') }

  it { should have_valid(:manufacturer).when('Western Digital') }
  it { should_not have_valid(:manufacturer).when(nil, '') }

  it { should have_valid(:hdd_type).when('HDD') }
  it { should_not have_valid(:hdd_type).when(nil, '') }

  it { should have_valid(:capacity).when('1TB') }
  it { should_not have_valid(:capacity).when(nil, '') }

  it { should have_valid(:interface).when('SATA 6GB/s') }
  it { should_not have_valid(:interface).when(nil, '') }

  it { should have_valid(:cache).when('64MB') }
  it { should_not have_valid(:cache).when(nil, '') }

  it { should have_valid(:rpm).when('7200') }
  it { should_not have_valid(:rpm).when(nil, '') }

  it { should have_valid(:form_factor).when('3.5"') }
  it { should_not have_valid(:form_factor).when(nil, '') }
end
