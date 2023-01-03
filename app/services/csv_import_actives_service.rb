class CsvImportActivesService
    require 'csv'
  
    def call(file)
      file = File.open(file)
      csv = CSV.parse(file, headers: true, col_sep: ',')
      csv.each do |row|
        a_hash = {}
        a_hash[:id] = row['NUMERO']
        a_hash[:name] = row['NOMBREACTIVO']
        a_hash[:destination_id] = row['CODDESTINO']
        a_hash[:ubication_id] = row['CODUBICACION']
        a_hash[:user_id] = row['CEDULA']
        a_hash[:rankactive_id] = row['CODJERARQUIA']
        a_hash[:status] = row['ESTADO']
        Active.find_or_create_by!(a_hash)
        # binding.b
        # p row
      end
    end
end