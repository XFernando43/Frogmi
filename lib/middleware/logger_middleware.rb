# lib/middleware/logger_middleware.rb

class LoggerMiddleware
    def initialize(app)
      @app = app
    end
  
    def call(env)
      # Aquí puedes registrar información sobre la solicitud entrante
      puts "Request received: #{env['REQUEST_METHOD']} #{env['PATH_INFO']}"
  
      # Llama al siguiente middleware en la cadena
      @app.call(env)
    end
  end
  