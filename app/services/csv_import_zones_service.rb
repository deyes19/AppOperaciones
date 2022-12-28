class CsvImportZonesService
    require 'csv'
  
    def call(file)
      file = File.open(file)
      csv = CSV.parse(file, headers: true, col_sep: ',')
      csv.each do |row|
        z_hash = {}
        z_hash[:id] = row['IDZONA']
        z_hash[:description] = row['NOMBRE']
        Zone.find_or_create_by!(z_hash)
        # binding.b
        # p row
      end
    end
end