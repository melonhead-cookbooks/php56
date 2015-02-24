# encoding: utf-8

require_relative 'spec_helper'

describe 'php56::default' do
  before do
    stub_resources
    Fauxhai.mock(:platform => 'centos', :version => '6.4')
  end

  describe 'centos' do
    let(:chef_run) do
      ChefSpec::Runner.new(
        :platform => 'centos',
        :version => '6.4'
      ).converge(described_recipe)
    end

    it 'includes recipe dev' do
      expect(chef_run).to_not include_recipe('php56::dev')
    end
    it 'includes recipe install' do
      expect(chef_run).to include_recipe('php56::install')
    end

    it 'includes recipe configure' do
      expect(chef_run).to include_recipe('php56::configure')
    end

    it 'installs the PHP package' do
      expect(chef_run).to install_package('php')
    end
  end
end
