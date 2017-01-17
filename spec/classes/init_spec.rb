require 'spec_helper'
describe 'nis_removal' do
  context 'with default values for all parameters' do
    it { should contain_class('nis_removal') }
  end
end
