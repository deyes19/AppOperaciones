class CsvImportActivesService2
    require 'csv'
  
    def call(file)
      file = File.open(file)
      csv = CSV.parse(file, headers: true, col_sep: ',')
      csv.each do |row|
        a1_hash = {}
        a1_hash[:id] = row['Codigo']
        a1_hash[:name] = row['Nombre del Activo fijo']
        a1_hash[:destination_id] = row['Destino']
        a1_hash[:plate] = row['Placa']
        a1_hash[:ubication_id] = row['Ubicación']
        a1_hash[:user_id] = row['Responsable']
        a1_hash[:active_type_id] = row['Tipo']
        a1_hash[:status] = row['Activo']
        a1_hash[:rankactive_id] = 8
        a1_hash[:serial] = row['Serial']
        Active.find_or_create_by!(a1_hash)
        # binding.b
        # p row
      end
    end
end