Rails.application.config.middleware.insert_before 0, Rack::Cors do
    allow do
      origins '*' # Permite solicitudes desde cualquier origen
      resource '*', headers: :any, methods: [:get, :post, :put, :patch, :delete, :options, :head]
    end
end