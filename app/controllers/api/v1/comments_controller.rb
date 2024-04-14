module Api
  module V1
    class CommentsController < ApplicationController  
      before_action :set_comment, only: [:show]
      skip_before_action :verify_authenticity_token, only: [:create]

      #get all
      def index
        comments = Comment.all
        render json: {
          status: 'exitoso papi',
          message: 'comentarios encontrados',
          comments: comments
        }, status: :ok
      end

      #get comment By iD
      def show
        render json: {
          status: 'success',
          message: 'comment obtained successfully',
          data: @comment
        }, status: :ok
      end

      # create comentario
      def create
        report_id = params[:report_id]
        body = params[:comment] # Aquí obtenemos directamente el valor del cuerpo del comentario
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

      private
      def set_comment
        @comment = Comment.where(report_id: params[:report_id])
        
        if @comment.empty?
          render json: {
            status: 'error',
            message: 'comments not found for report_id'
          }, status: :not_found
        end
      end
    end
  end 
end
