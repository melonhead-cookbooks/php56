# Encoding: utf-8

require_relative 'spec_helper'

describe 'default' do
  it 'listens on port 22' do
    expect(port(22)).to be_listening
  end
end
