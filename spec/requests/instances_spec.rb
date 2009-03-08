require File.join(File.dirname(__FILE__), '..', 'spec_helper.rb')

describe "/instances" do
  before(:each) do
    @response = request("/instances")
  end
end