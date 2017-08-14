require 'dotenv/tasks'
require 'zip'
require 'csv'

well_index_dir = Rails.root.join('lib','well_index_files')
zipfile_name = well_index_dir + 'well_index.zip'

task :update_well_index => :seed_wells do
end

task download_well_index: :dotenv do
  puts 'Downloading'
  well_index_url = 'https://www.dmr.nd.gov/oilgas/basic/well_index.zip'
  FileUtils.rm_rf("#{well_index_dir}/.", secure: true)
  agent = Mechanize.new
  agent.basic_auth(ENV['NDIC_USER_NAME'], ENV['NDIC_PASSWORD'])
  file = agent.get(well_index_url)
  file.save (well_index_dir + 'well_index.zip')
end

task :unzip_well_index => :download_well_index do
  puts 'Unzipping'
  Zip::File.open(zipfile_name) do |zip_file|
    zip_file.each do |f|
      f_path = File.join(well_index_dir + f.name)
      puts f.name
      zip_file.extract(f, f_path)
    end
  end
end

task :seed_wells => [:environment] do
  puts 'Cleaning'
  clean_csv = []
  csv_file = File.open(well_index_dir + 'WellIndex.csv')
  csv_file.each_with_index do |row, i|
    # row = row.gsub(/"/, '').gsub(/\r\n/, '').gsub(/, INC/, '').gsub(/, LLC/, '').split(',') #remove extra quotes and carriage return
    row = row.gsub(/"/, '').gsub(/\r\n/, '').split(',') #remove extra quotes and carriage return
    clean_csv << row
  end
  CSV.open(well_index_dir + 'cleaned_well_index.csv', 'w') do |file|
    clean_csv.each do |row|
      file.puts row
    end
  end
  csv_file = File.open(well_index_dir + 'cleaned_well_index.csv')
  puts 'Seeding'
  CSV.foreach(csv_file, :headers => true, :header_converters => :symbol) do |row|
    # byebug if row[:wellstatusdate] == 'Confidential'
    row[:spuddate] = '' if row[:spuddate] == 'Confidential'
    row[:wellstatusdate] = '' if row[:wellstatusdate] == 'Confidential'
    if row[:wellstatusdate].present?
      new_date = row[:wellstatusdate].split('/')
      row[:wellstatusdate] = Date.new(new_date[2].to_i, new_date[0].to_i, new_date[1].to_i)
    end

    NdWell.create(  
      api_no: row[:apino],
      file_no: row[:fileno],
      current_operator: row[:currentoperator],
      current_well_name: row[:currentwellname],
      lease_name: row[:leasename],
      lease_number: row[:leasenumber],
      original_operator: row[:originaloperator],
      original_well_name: row[:originalwellname],
      spud_date: row[:spuddate],
      td: row[:td],
      county_name: row[:countyname],
      township: row[:township],
      range: row[:range],
      section: row[:section],
      qq: row[:qq],
      footages: row[:footages],
      field_name: row[:fieldname],
      produced_pools: row[:producedpools],
      oil_water_gas_cums: row[:oilwatergascums],
      ipt_date_oil_water_gas: row[:iptdateoilwatergas],
      wellbore: row[:wellbore],
      latitude: row[:latitude],
      longitude: row[:longitude],
      well_type: row[:welltype],
      well_status: row[:wellstatus],
      ctb: row[:ctb],
      well_status_date: row[:wellstatusdate]
      )
  end
end
