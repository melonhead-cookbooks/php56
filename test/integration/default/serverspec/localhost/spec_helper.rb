# Encoding: utf-8
require 'serverspec'

set :backend, :exec
set :path, '/sbin:/usr/bin:$PATH'

RSpec.configure do |config|
  config.expect_with :rspec do |c|
    c.syntax = :expect  # disables `should`
  end
end
