Rails.application.routes.draw do

  namespace 'api' do
    namespace 'v1'do
      resources :reportes
      resources :comments
    end
  end


end
