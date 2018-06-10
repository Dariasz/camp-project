Rails.application.routes.draw do

  root 'static_pages/info_pages#index'

  get 'layouts/language_select'

  devise_for :users, path: '',  controllers: { :registrations => "user/registrations", sessions: 'user/sessions' }

  get 'dashboard', to: 'admin/users#show'

  resources :activities do
    get :change_status, on: :member
    get :my_activities, on: :collection
  end

  resources :events do
    get :change_status, on: :member
    get :calendar, on: :collection
  end

  resources :feedbacks do
    get :received_feedbacks, on: :collection
    get :my_feedbacks, on: :collection
    get :bad_feedbacks, on: :collection
  end

  resources :editions do
    put :apply_for, on: :member
  end

  resources :solutions do
    get :my_solutions, on: :collection
  end

  resources :sequences do
    get :statistics, on: :member
  end

  resources :tasks

  namespace :admin do
    resources :users do
      get :others, on: :collection
      get :presence, on: :collection
    end
  end

  resources :activity_attachments
end
