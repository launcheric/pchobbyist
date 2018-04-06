require 'rails_helper'

RSpec.describe NetworkCard, type: :model do
  it { should have_valid(:name).when('Asus - PCE-AC55BT B1 PCI-Express x1 802.11a/b/g/n/ac Wi-Fi Adapter') }
  it { should_not have_valid(:name).when(nil, '') }

  it { should have_valid(:manufacturer).when('Asus') }
  it { should_not have_valid(:manufacturer).when(nil, '') }

  it { should have_valid(:interface).when('PCI-Express x1') }
  it { should_not have_valid(:interface).when(nil, '') }

  it { should have_valid(:protocols).when('802.11a/b/g/n/ac') }
  it { should_not have_valid(:protocols).when(nil, '') }

  it { should have_valid(:security).when('64-bit WEP, 128-bit WEP, WPA2-PSK, WPA-PSK') }
  it { should_not have_valid(:security).when(nil, '') }
end
