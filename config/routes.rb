Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      resources :reports
      resources :comments, path: '/comments/:report_id'
    end
  end
end
