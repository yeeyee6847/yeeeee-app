Rails.application.routes.draw do
  root 'home#index'
  get '/home/index', to: 'home#index'

  # Main resources
  resources :yearly_usages do
    resources :monthly_usages do
      resources :daily_usages do
        resources :expense_items
      end
    end
  end

  # Maintenance resources
  resources :months
  resources :spending_types
  resources :daily_statuses
end
