Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      resources :reports
      resources :comments, only: [:index, :create], path: '/comments/:report_id'
    end
  end
end
