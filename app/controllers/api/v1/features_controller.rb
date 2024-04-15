module Api
  module V1
    class FeaturesController < ApplicationController
      before_action :set_report, only: [:show]

      # GET /api/v1/reports
      def index
        page = params[:page] || 1
        per_page = params[:per_page] || 10
        reports = Report.paginate(page: page, per_page: per_page)

        render json: {
          status: 'success',
          message: 'Reports obtained successfully',
          data: reports,
          pagination: {
            current_page: reports.current_page,
            per_page: reports.per_page,
            total_entries: reports.total_entries,
            total_pages: reports.total_pages
          }
        }, status: :ok
      end

      # GET /api/v1/reports/:id
      def show
        render json: {
          status: 'success',
          message: 'Report obtained successfully',
          data: @report
        }, status: :ok
      end

      private
      # Set the report based on the ID parameter
      def set_report
        @report = Report.find(params[:id])
        rescue ActiveRecord::RecordNotFound
          render json: {
            status: 'error',
            message: 'Report not found'
          }, status: :not_found
      end

      
    end
  end
end
