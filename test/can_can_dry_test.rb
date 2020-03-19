# frozen_string_literal: true

require 'test_helper'

class CanCanDryTest < ActiveSupport::TestCase
  test 'truth' do
    assert_kind_of Module, CanCanDry
  end
end
