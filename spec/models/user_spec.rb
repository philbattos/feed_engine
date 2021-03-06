require 'spec_helper'

describe User do
  subject do
    User.new(username: 'raphael')
  end

  it 'requires a username' do
    expect{ subject.username = '' }.to change { subject.valid? }.to be_false
  end

  it 'requires a unique username' do
    subject.save
    expect(User.new(:username => 'raphael')).to_not be_valid
  end

  it 'responds with username for paths' do
    expect(subject.to_param).to eq 'raphael'
  end

  it 'parameterizes username on validation' do
    subject.username = "this is a frickin test"
    expect { subject.save }.to change { subject.username }.to 'this-is-a-frickin-test'
  end
end
