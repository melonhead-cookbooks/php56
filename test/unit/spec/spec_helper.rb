# encoding: UTF-8
# spec_helper.rb
require 'rspec/expectations'
require 'chefspec'
require 'chefspec/berkshelf'

::LOG_LEVEL = :fatal
::CENTOS_OPTS = {
  :platform => 'centos',
  :version =>  '6.4',
  :log_level => ::LOG_LEVEL
}
::CHEFSPEC_OPTS = {
  :log_level => ::LOG_LEVEL
}

def stub_resources
  # Use stub_command to add return values for shell commands, since
  # chefspec executes in memory only
  # stub_command("npm -v 2>&1 | grep '1.1.0-3'").and_return(true)

  # Use stub_data_bag and below stanza if your cookbook depends on
  # databags.
  # stub_data_bag('secured').and_return(%w(dev production))
  # Chef::EncryptedDataBagItem.stub(:load).with('secured', 'dev').and_return(
  #  key: 'value'
  # )
end

at_exit do
  ChefSpec::Coverage.start! do
    # Use add_filter to add cookbooks to ignore running tests for
    # add_filter 'cookbook/build-essential'
  end
end
