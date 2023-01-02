class CsvImportActivesService
    require 'csv'
  
    def call(file)
      file = File.open(file)
      csv = CSV.parse(file, headers: true, col_sep: ',')
      csv.each do |row|
        a_hash = {}
        a_hash[:id] = row['']
        a_hash[:name] = row['']
        a_hash[:destination_id] = row['']
        a_hash[:ubication_id] = row['']
        a_hash[:user_id] = row['']
        a_hash[:active_type_id] = row['']
        a_hash[:status] = row['']
        Active.find_or_create_by!(a_hash)
        # binding.b
        # p row
      end
    end
end