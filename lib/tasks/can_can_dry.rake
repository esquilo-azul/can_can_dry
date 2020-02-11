# frozen_string_literal: true

namespace :can_can_dry do
  desc 'Mostra o mapeamento de CanCanDry'
  task ability_mapping: :environment do
    AbilityMapping.new.mapping.each do |controller, actions|
      puts "#{controller} (#{actions.count})"
      actions.each do |action|
        puts "\t#{action}"
      end
    end
  end

  desc 'Inform the path and receive the controller/action.'
  task :path_recognize, [:path] => :environment do |_t, args|
    Aranha::AddressesController.new
    r = ::CanCanDry::PathRecognizer.recognize('', args.path)
    Rails.logger.info("Result: #{r}")
  end
end
