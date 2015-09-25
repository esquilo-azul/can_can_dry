require 'pathname'
lib_root = Pathname.new(File.expand_path('..', __FILE__))
exclude = %w(can_can_dry can_can_dry/railtie can_can_dry/version)
Dir.glob("#{lib_root}/**/*.rb") do |f|
  rp = Pathname.new(f).relative_path_from(lib_root).sub(/\.rb\z/, '')
  require_dependency rp unless exclude.include?(rp.to_s)
end

require 'can_can_dry/railtie'

module CanCanDry
  ActionView::Base.send :include, CanCanDry::Helpers::CanCanDryHelper
end
