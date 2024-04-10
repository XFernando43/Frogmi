module Api

    module V1
        
        class ReportsController < ApplicationController
            def index 
                # reports = report.order('reportid');
                render json:{
                    status: 'exitoso',
                    message: ':3',
                }, status: :ok
            end
            
        end
    end

end

