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
end
