require 'json'

well_index_dir = Rails.root.join('lib', 'wells_json')

task export_db_to_json_file: [:environment] do
  puts 'Reading database'
  wells = NdWell.all

  puts 'Creating json file'
  File.open(well_index_dir + 'nd_wells.json', 'w') do |f|
    wells.each do |well|
      f.write(well.to_json)
    end
  end
end
