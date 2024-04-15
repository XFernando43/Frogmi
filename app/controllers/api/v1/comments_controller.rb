module Api
  module V1
    class CommentsController < ApplicationController  
      skip_before_action :verify_authenticity_token, only: [:create]

      #get all
      def index
        reportId = params[:report_id]
        comments = Comment.where(report_id: reportId)
        render json: {
          status: 'success',
          message: 'comentarios encontrados',
          comments: comments
        }, status: :ok
      end

      # create comentario
      def create
        report_id = params[:report_id]
        body = params[:comment]
        comment = Comment.new(body: body, report_id: report_id)
        
        if comment.save
          render json: {
            status: 'success',
            message: 'Comentario creado exitosamente',
            data: comment
          }, status: :created
        else
          render json: {
            status: 'error',
            message: 'No se pudo crear el comentario',
            errors: comment.errors
          }, status: :unprocessable_entity
        end
      end

    end
  end 
end
