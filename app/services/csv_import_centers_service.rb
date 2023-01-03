class CsvImportCentersService
    require 'csv'
  
    def call(file)
      file = File.open(file)
      csv = CSV.parse(file, headers: true, col_sep: ',')
      csv.each do |row|
        c_hash = {}
        c_hash[:id] = row['CODCCOSTO']
        c_hash[:name] = row['NOMBRECCOSTO']
        c_hash[:zone_id] = row['CODZONA']
        Center.find_or_create_by!(c_hash)
        # binding.b
        # p row
      end
    end
end