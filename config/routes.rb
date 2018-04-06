Rails.application.routes.draw do
  root 'builds#index'
  devise_for :users
  namespace :api do
    namespace :v1 do
      resources :builds
    end
  end
  namespace :api do
    namespace :v1 do
      resources :cpus, :motherboards, :computer_cases, :memory_cards, :hard_drives, :users, only: [:index, :show]
      resources :power_supplies, :video_cards, :cpu_coolers, :network_cards, :computer_cases, only: [:index, :show]
    end
  end

  resources :users

  resources :builds do
    resources :comments
  end

  resources :computer_cases, :cpus, :hard_drives, :memory_cards, :motherboards, :comments
  resources :power_supplies, :video_cards, :cpu_coolers, :network_cards, :builds, :tutorials
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
