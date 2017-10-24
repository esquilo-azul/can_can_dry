# frozen_string_literal: true
require 'test_helper'

module CanCanDry
  class PathRecognizerTest < ActiveSupport::TestCase
    test 'remove_root_path' do
      [%w(/path/to/action /prefix/ /prefix/path/to/action),
       %w(/path/to/action /prefix /prefix/path/to/action),
       %w(/path / /path),
       ['/path', '', '/path'],
       %w(/unknown/path /abc /unknown/path)].each do |s|
        assert_equal s[0], ::CanCanDry::PathRecognizer.send(:remove_root_path, s[1], s[2]), s
      end
    end
  end
end
