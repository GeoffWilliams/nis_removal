require 'spec_helper'
describe 'nis_removal::nis_lockdown' do
  let :facts do
    {
      :osfamily => 'AIX',
    }
  end
  context 'with default values for all parameters' do
    it { should contain_class('nis_removal::nis_lockdown') }
  end

  context 'fails on non-aix' do
    let :facts do
      {
        :osfamily => 'RedHat',
      }
    end
    it {
      expect { should compile }.to raise_error(/only supports AIX/)
    }
  end
end
