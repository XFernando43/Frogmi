module Api
  module V1
    class ReportsController < ApplicationController
      def index
        page = params[:page] || 1
        per_page = params[:per_page] || 10

        reports = Report.paginate(page: page, per_page: per_page)

        render json: {
          status: 'exitoso',
          message: 'Reportes obtenidos exitosamente',
          data: reports,
          pagination: {
            current_page: reports.current_page,
            per_page: reports.per_page,
            total_entries: reports.total_entries,
            total_pages: reports.total_pages
          }
        }, status: :ok
      end
    end
  end
end


                # #pagination
                # page = params[:page] || 1
                # per_page = params[:per_page] || 10
                # mag_types = params[:filters][:mag_type] if params[:filters].present? && params[:filters][:mag_type].present?
            
                # # API GET
                # response = Net::HTTP.get(URI('https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/all_month.geojson'))
                # earthquakes = JSON.parse(response)['features']
            
                # # Aplicar filtrado si se especifican tipos de magnitud
                # if mag_types.present?
                #   earthquakes.select! { |earthquake| mag_types.include?(earthquake['properties']['magType']) }
                # end
            
                # # Aplicar paginación  ||||| Reparar no funciona 
                # start_index = (page.to_i - 1) * per_page.to_i
                # paginated_data = earthquakes[start_index, per_page.to_i]
  
  
                # #data saving
                # #data.each do |feature|
                # #Report.create!(
                # #mag_type: feature['properties']['magType'],
                # ## Otros atributos que deseas guardar en tu modelo Report
                # #)
            
                # render json: {
                #   status: 'exitoso',
                #   message: ':3',
                #   data: paginated_data,
                #   pagination: {
                #     current_page: page.to_i,
                #     per_page: per_page.to_i,
                #     total: earthquakes.length
                #   }
                # }, status: :ok
              
              