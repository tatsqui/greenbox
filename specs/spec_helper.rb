require "simplecov"
SimpleCov.start do
  add_filter %r{^/specs?/}
end

require "time"
require "minitest"
require "minitest/autorun"
require "minitest/reporters"
require "minitest/skip_dsl"
require "awesome_print"

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

# Require_relative your lib files here!
require_relative "../lib/date_range"
require_relative "../lib/movie"
require_relative "../lib/rental"
