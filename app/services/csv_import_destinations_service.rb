class CsvImportDestinationsService
    require 'csv'
  
    def call(file)
      file = File.open(file)
      csv = CSV.parse(file, headers: true, col_sep: ',')
      csv.each do |row|
        d_hash = {}
        d_hash[:id] = row['CODDESTINO']
        d_hash[:description] = row['NOMBREDESTINO']
        d_hash[:center_id] = row['Ccosto']
        Destination.find_or_create_by!(d_hash)
        # binding.b
        # p row
      end
    end
end