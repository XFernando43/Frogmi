
module Api 

  module V1
    class CommentsController < ApplicationController  
      
      skip_before_action :verify_authenticity_token, only: [:create]


      def index
        comments = Comment.all
        render json: {
          status: 'exitoso papi',
          message: 'comentarios encontrados',
          comments: comments
        }, status: :ok
      end

      # Método para obtener comentarios por report_id
      def index_by_report
        report_id = params[:report_id]
        comments = Comment.where(report_id: report_id)
        
        if comments.any?
          render json: {
            status: 'exitoso papi',
            message: "comentarios encontrados para el reporte con ID #{report_id}",
            comments: comments
          }, status: :ok
        else
          render json: {
            status: 'error',
            message: "No se encontraron comentarios para el reporte con ID #{report_id}"
          }, status: :not_found
        end
      end

      def create
        report_id = params[:report_id] # Aquí obtenemos el report_id de los parámetros de la solicitud
        comment = Comment.new(body: "HOLIWI", report_id: report_id)
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




# comment = Comment.new(comment_params)
        
        # if comment.save
        #   render json: {
        #     status: "exitoso",
        #     message: "Comentario creado",
        #     data: comment
        #   }, status: :ok
        # else
        #   render json: {
        #     status: "Fallido",
        #     message: "Comentario no creado",
        #     errors: comment.errors.full_messages
        #   }, status: :unprocessable_entity
        # end


      # private
      
      # def comment_params
      #   params.require(:comment).permit(:body, :report_id)
      # end
      


