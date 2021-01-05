require "bundler/setup"
require "codecov"
require "simplecov"
SimpleCov.start
SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
                        SimpleCov::Formatter::HTMLFormatter,
                        SimpleCov::Formatter::Codecov
                      ])
require "linguists_field_guide"
