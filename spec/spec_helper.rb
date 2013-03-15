SPEC_ROOT = File.dirname(__FILE__).freeze

require "rspec"
require "cf"
require "cfoundry"
require "webmock"
require "cfoundry/test_support"
require "cf/test_support"
require "fakefs/safe"

WebMock.disable_net_connect!

RSpec.configure do |c|
  c.include Fake::FakeMethods
  c.include InteractHelper
  c.mock_with :rr
end
