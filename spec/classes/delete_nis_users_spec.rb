#require 'spec_helper'
require 'spec_helper'

# all we can really do for this one is check our code compiles
describe 'nis_removal::delete_nis_users' do
  context 'with default values for all parameters' do
    it { should contain_class('nis_removal::delete_nis_users') }
  end

  context 'does not attempt to update /etc/shadow on AIX' do
    let :facts do
      {
        :osfamily => 'AIX',
      }
    end
    it { should_not contain_file_line("delete NIS users from /etc/shadow") }
  end
end
