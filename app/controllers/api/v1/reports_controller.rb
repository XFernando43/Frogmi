require 'net/http'  

module Api
    module V1

        class ReportsController < ApplicationController
            def index

                #pagination
              page = params[:page] || 1
              per_page = params[:per_page] || 10
              mag_types = params[:filters][:mag_type] if params[:filters].present? && params[:filters][:mag_type].present?
          
              # API GET
              response = Net::HTTP.get(URI('https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/all_month.geojson'))
              earthquakes = JSON.parse(response)['features']
          
              # Aplicar filtrado si se especifican tipos de magnitud
              if mag_types.present?
                earthquakes.select! { |earthquake| mag_types.include?(earthquake['properties']['magType']) }
              end
          
              # Aplicar paginación
              start_index = (page.to_i - 1) * per_page.to_i
              paginated_data = earthquakes[start_index, per_page.to_i]
          
              render json: {
                status: 'exitoso',
                message: ':3',
                data: paginated_data,
                pagination: {
                  current_page: page.to_i,
                  per_page: per_page.to_i,
                  total: earthquakes.length
                }
              }, status: :ok
            end
          end
          
          
    end

end

