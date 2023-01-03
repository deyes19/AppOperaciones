class CsvImportActivesService
    require 'csv'
  
    def call(file)
      file = File.open(file)
      csv = CSV.parse(file, headers: true, col_sep: ',')
      csv.each do |row|
        a_hash = {}
        a_hash[:id] = row['Codigo']
        a_hash[:name] = row['Nombre del Activo fijo']
        a_hash[:destination_id] = row['Destino']
        a_hash[:plate] = row['Placa']
        a_hash[:ubication_id] = row['Ubicación']
        a_hash[:user_id] = row['Responsable']
        a_hash[:active_type_id] = row['Tipo']
        a_hash[:status] = row['Activo']
        a_hash[:rankactive_id] = 7
        a_hash[:serial] = row['Serial']
        Active.find_or_create_by!(a_hash)
        # binding.b
        # p row
      end
    end
end