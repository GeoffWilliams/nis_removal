require 'spec_helper'
describe 'nis_removal' do
  let :facts do
    {
      :osfamily => 'RedHat',
    }
  end
  context 'with default values for all parameters' do
    it { should contain_class('nis_removal') }
  end
end
