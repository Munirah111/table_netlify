Rails.application.routes.draw do
  resources :table_entries
  root "table_entries#index"  # 👈 This makes Table 1 & Table 2 show on homepage
end
