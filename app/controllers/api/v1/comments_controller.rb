
module Api 

  module V1
    class CommentsController < ApplicationController  
      
      def index  
        render json: {
          status: 'exitoso papi ',
          message: 'comentarios ',
        }, status: :ok
      end      


      def create
        
        render json: {
          status: 'exitoso papi ',
          message: 'comentarios ',
        }, status: :ok

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
      


