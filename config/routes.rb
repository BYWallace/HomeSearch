Rails.application.routes.draw do
  root to: "agents#random_agent"

  resources :agents do
    resources :uploaded_transactions
    resources :bulk_imports, only: [:new, :create]
  end
end
