
module Api
    module V1

        class CommentsController < ApplicationController
            


            
            # def create
          #@report = Report.find(params[:report_id])
          #@comment = @report.comments.build(comment_params)
          #if @comment.save
          #render json: @comment, status: :created
          #else
          #render json: @comment.errors, status: :unprocessable_entity
          #end
          #end
          
            # private
          
            # def comment_params
            #   params.require(:comment).permit(:body)
            # end

            def index

                render json: {
                  status: 'exitoso papi ',
                  message: 'comentarios ',
                }, status: :ok
  
              end








        end
          


    end
end



