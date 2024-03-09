# frozen_string_literal: true

require 'can_can_dry/path_recognizer'

RSpec.describe CanCanDry::PathRecognizer do
  describe '#remove_root_path' do
    [%w[/path/to/action /prefix/ /prefix/path/to/action],
     %w[/path/to/action /prefix /prefix/path/to/action],
     %w[/path / /path],
     ['/path', '', '/path'],
     %w[/unknown/path /abc /unknown/path]].each do |s|
      it do
        expect(described_class.send(:remove_root_path, s[1], s[2])).to eq(s[0])
      end
    end
  end
end
