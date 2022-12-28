class CsvImportUbicationsService
    require 'csv'
  
    def call(file)
      file = File.open(file)
      csv = CSV.parse(file, headers: true, col_sep: ',')
      csv.each do |row|
        u_hash = {}
        u_hash[:id] = row['']
        u_hash[:name] = row['']
        Ubication.find_or_create_by!(u_hash)
        # binding.b
        # p row
      end
    end
end